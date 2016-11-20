# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>

pkgname=ghostwriter
pkgver=1.4.2
pkgrel=2
pkgdesc="A cross-platform, aesthetic, distraction-free Markdown editor"
arch=('i686' 'x86_64')
url="https://github.com/wereturtle/ghostwriter"
license=('GPL3')
depends=('qt5-base' 'qt5-webkit' 'hunspell' 'markdown' 'hicolor-icon-theme')
source=("https://github.com/wereturtle/ghostwriter/archive/v${pkgver}.tar.gz")
md5sums=('22d664c44a5faf537004fb815b723746')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  qmake PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make install INSTALL_ROOT="${pkgdir}"
}
