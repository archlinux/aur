pkgname=pomo
pkgver=0.7.2
pkgrel=1

pkgdesc='Pomodoro Command Line Interface'
url='https://kevinschoon.github.io/pomo/'
arch=(x86_64 aarch64)
license=(MIT)

#epends=()
makedepends=('go')


source=("https://github.com/kevinschoon/pomo/archive/${pkgver}.tar.gz" "pomo.1.gz")
build() {
	cd ${pkgname}-${pkgver}
  #export GOOS=linux
  #export GOARCH=arm64
  #export BUILD_NUMBER=1
  export BUILD_VERSION=${pkgver}
  make bin/pomo
}

package() {
  mkdir -p $pkgdir/usr/bin
  install -Dm 755 $srcdir/${pkgname}-${pkgver}/bin/pomo "$pkgdir/usr/bin/pomo"
  install -Dm 644 $srcdir/pomo.1.gz "$pkgdir/usr/share/man/man1/pomo.1.gz"
}

md5sums=('4884ac7aa8acd674b3f3f8f30f322cf0'
         'fa5b708af2c606a52d65f3231146fe22')
sha512sums=('e95faeb1bbe6324063c5ebe9a81b0082ce238abd42385026c04b1582c65ac1494d8e259bfa873058f725c12e0888f2b0d0dad7808102bd0bf763ca79e645637b'
            'c6b61ca7a6a2f6be154cea4515853ac131e27cbfa52ee1c1d0d9eb78767bccd103efaf1ed0bdd434879f0fac999db24e7e5fb44db492735fee774bd2f2059bc8')
