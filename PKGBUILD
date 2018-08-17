# Maintainer: Alex J. Malozemoff <amaloz@galois.com>
pkgname=matterhorn
pkgver=40901.0.0
pkgrel=3
pkgdesc="A terminal-based chat client for MatterMost"
arch=('any')
url="https://github.com/matterhorn-chat/matterhorn"
license=('BSD')
provides=('matterhorn')
conflicts=('matterhorn-git' 'matterhorn-bin')
depends=('ncurses5-compat-libs')
makedepends=('git' 'cabal-static' 'ghc-static')
source=("https://github.com/matterhorn-chat/matterhorn/archive/${pkgver}.tar.gz")
sha1sums=('183fc10600066a1ad47d235fc29597300eb14ca3')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./install.sh
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -m755 -D $(find . -name "matterhorn" -type f) "${pkgdir}"/usr/bin/matterhorn
  install -m644 -D LICENSE "${pkgdir}"/usr/share/licenses/matterhorn/LICENSE
}
