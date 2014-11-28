# Maintaier: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=md5
pkgver=2.3
pkgrel=1
pkgdesc="An md5 hash printing utility, that can have files or strings as input"
arch=('i686' 'x86_64')
url="http://www.fourmilab.ch/md5/"
license=('custom')
source=(http://www.fourmilab.ch/md5/$pkgname.tar.gz
        COPYING)
md5sums=('c97245b84d45d6798f5f498f8a9a7c1e'
         '7d811169878aefba828302d9a48f84de')

build() {
  cd "${srcdir}"

  make
}

package() {
  cd "${srcdir}"
  
  install -Dm755 "$pkgname" "${pkgdir}/usr/bin/$pkgname"
  install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/$pkgname/COPYING"
}
