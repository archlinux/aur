pkgname=pomo
pkgver=0.7.1
pkgrel=1

pkgdesc='Pomodoro Command Line Interface'
url='https://kevinschoon.github.io/pomo/'
arch=(x86_64 aarch64)
license=(MIT)

#epends=()
makedepends=('go')


source=("https://github.com/kevinschoon/pomo/archive/0.7.1.tar.gz" "pomo.1.gz"
)
build() {
	cd ${pkgname}-${pkgver}
  #export GOOS=linux
  #export GOARCH=arm64
  #export BUILD_NUMBER=1
  export BUILD_VERSION=${pkgver}
  make 
}

package() {
  mkdir -p $pkgdir/usr/bin
  install -Dm 755 $srcdir/${pkgname}-${pkgver}/bin/pomo "$pkgdir/usr/bin/pomo"
  install -Dm 644 $srcdir/pomo.1.gz "$pkgdir/usr/share/man/man1/pomo.1.gz"
}

md5sums=('fdf660c19c263f4216f4a38f01153393'
         'fa5b708af2c606a52d65f3231146fe22')
sha512sums=('224a5c58348078ab12c07fa31977203eef11d502045f78df572e0545e8d8816ab0b9e274e81464fc328a588d1520618ece34f6f065f97286d86d707d3a8aca66'
            'c6b61ca7a6a2f6be154cea4515853ac131e27cbfa52ee1c1d0d9eb78767bccd103efaf1ed0bdd434879f0fac999db24e7e5fb44db492735fee774bd2f2059bc8')
