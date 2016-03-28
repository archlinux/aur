# Maintainer: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>

pkgname=ghostwriter
pkgver=1.3.1
pkgrel=1
pkgdesc="ghostwriter is a cross-platform, aesthetic, distraction-free Markdown editor."
arch=(i686 x86_64)
url="https://github.com/wereturtle/ghostwriter"
license=('GPL3')
source=('ghostwriter.tar.gz::https://github.com/wereturtle/ghostwriter/archive/v1.3.1.tar.gz')
sha256sums=('fc6905db86c3285d6e634d779c024a8988457fa453d93be759d446af0c7ed560')
conflicts=('ghostwriter-git')
provides=('ghostwriter-git')
makedepends=('qtchooser')
depends=('qt5-base' 'qt5-webkit' 'hunspell' 'desktop-file-utils' 'gtk-update-icon-cache')
install=ghostwriter.install

build() {
  cd "${pkgname}-${pkgver}"
  qmake PREFIX=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make INSTALL_ROOT="$pkgdir/" install
}
