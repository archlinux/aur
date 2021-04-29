# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=fatattr
pkgver=1.0.1
pkgrel=7
pkgdesc="Display or change attributes on a FAT filesystem"
arch=('i686' 'x86_64')
url="http://kernel.org/pub/linux/utils/fs/fat/fatattr/"
license=('GPL2')
source=(https://deb.debian.org/debian/pool/main/f/${pkgname}/${pkgname}_${pkgver}.orig.tar.xz)
b2sums=('973c0003bf0c8d4955754eda0757f51b82995b647c96ca4147127e67e65ffe559b9b872173c8151bde5e481da5fb3ef6b25698581c2b90267d437e07d327c18e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make INSTALLROOT="$pkgdir" install
}
