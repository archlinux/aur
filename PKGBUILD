# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Joe Carta <cartakid at gmail dot com>
# Contributor: sidious/SiD <miste78 web de>
# Contributor: Wes Brewer <brewerw@gmail.com>

pkgname=extract-xiso
_pkgver=build-202303040307
pkgver=202303040307
pkgrel=1
pkgdesc="Xbox ISO Creation/Extraction utility"
url="https://github.com/XboxDev/extract-xiso"
arch=('x86_64' 'i686')
license=('custom')
makedepends=('git')
source=("git+$url.git")
sha256sums=('SKIP')

prepare() {
  # Switch tag version
  cd $pkgname
  git checkout tags/${_pkgver}
}

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  # Install binary
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  # Install custom license
  install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE.TXT"
}
