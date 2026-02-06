# Maintainer: cyprien <ton-email>
pkgname=hugvi
pkgver=1.3.0
pkgrel=1
pkgdesc="A note-taking app for programmers with markdown syntax (Pre-built binary)"
arch=('x86_64')
url="https://github.com/cbdefontenay/hugvi"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libnm' 'hicolor-icon-theme')
provides=('hugvi')
conflicts=('hugvi')

source_x86_64=("${url}/releases/download/Release/Hugvi_${pkgver}_amd64.deb")
sha256sums_x86_64=('SKIP')

prepare() {
  # On extrait le .deb
  bsdtar -xf "Hugvi_${pkgver}_amd64.deb"
  # On extrait l'archive data (qui contient /usr)
  bsdtar -xf data.tar.*
}

package() {
  cp -r usr/ "$pkgdir/"
}
