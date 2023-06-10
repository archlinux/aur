# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Joe Carta <cartakid at gmail dot com>
# Contributor: sidious/SiD <miste78 web de>
# Contributor: Wes Brewer <brewerw@gmail.com>

pkgname=extract-xiso
_pkgver=build-202303040307
pkgver=202303040307
pkgrel=2
pkgdesc="Xbox ISO Creation/Extraction utility"
url="https://github.com/XboxDev/extract-xiso"
arch=('x86_64' 'i686')
license=('custom')
makedepends=('cmake' 'git')
source=("git+$url.git#tag=$_pkgver")
sha256sums=('SKIP')

build() {
  cd $pkgname
  mkdir -p build
  cd build
  cmake ..
  make
}

package() {
  cd $pkgname
  # Install custom license
  install -Dm644 LICENSE.TXT -t "$pkgdir/usr/share/licenses/$pkgname"
  # Install binary
  install -Dm755 build/$pkgname -t "$pkgdir/usr/bin"
}
