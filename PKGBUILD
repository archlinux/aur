# Maintaier: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=md5
pkgver=2.3
pkgrel=1
pkgdesc="An md5 hash printing utility, that can have files or strings as input"
arch=('i686' 'x86_64')
url="http://www.fourmilab.ch/md5/"
license=('custom')
source=(http://www.fourmilab.ch/md5/$pkgname.tar.gz)
md5sums=('c97245b84d45d6798f5f498f8a9a7c1e')

build() {
  cd "${srcdir}"

  make
}

package() {
  cd "${srcdir}"

  install -Dm755 $pkgname "${pkgdir}"/usr/bin/$pkgname
#license
  install -d "${pkgdir}"/usr/share/licenses/${pkgname}/
  sed '1,10p;d' main.c > "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
