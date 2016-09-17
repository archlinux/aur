# Maintainer: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>

pkgname=ghostwriter
pkgver=1.4.2
pkgrel=1
pkgdesc="ghostwriter is a cross-platform, aesthetic, distraction-free Markdown editor."
arch=(i686 x86_64)
url="https://github.com/wereturtle/ghostwriter"
license=('GPL3')
source=("ghostwriter-${pkgver}.tar.gz::https://github.com/wereturtle/ghostwriter/archive/v${pkgver}.tar.gz")
sha256sums=('775760d04c5a794c3810cffe9d1daa72ee123c77cc3041fc15a2052503899438')
conflicts=('ghostwriter-git')
provides=('ghostwriter-git')
makedepends=('qtchooser')
depends=('qt5-base' 'qt5-webkit' 'hunspell' 'desktop-file-utils' 'gtk-update-icon-cache' 'markdown')
install=ghostwriter.install
optdepends=('hunspell: spell checking')

build() {
  cd "${pkgname}-${pkgver}"
  qmake PREFIX=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make INSTALL_ROOT="$pkgdir/" install
}
