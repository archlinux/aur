# Maintainer: Alex J. Malozemoff <amaloz@galois.com>
pkgname=matterhorn-bin
pkgver=50200.15.0
pkgrel=1
pkgdesc="A terminal-based chat client for MatterMost"
arch=('x86_64')
url="https://github.com/matterhorn-chat/matterhorn"
license=('BSD')
provides=('matterhorn')
conflicts=('matterhorn')
depends=('gmp' 'ncurses5-compat-libs' 'zlib')
source=("https://github.com/matterhorn-chat/matterhorn/releases/download/${pkgver}/matterhorn-${pkgver}-ubuntu-18.04-bionic-$CARCH.tar.bz2"
        "LICENSE::https://raw.githubusercontent.com/matterhorn-chat/matterhorn/c911e2d828fd2147b1a3f618acf4727b5c18df61/LICENSE")
sha1sums=('20ca9316b00e80360ea747df311ca8e16a30f774'
          '41bd788816973ea1340759da722bac169d6dc746')

package() {
  install -m644 -D LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  cd ${srcdir}/matterhorn-${pkgver}-ubuntu-18.04-bionic-${arch}
  install -m755 -D matterhorn ${pkgdir}/usr/bin/matterhorn
}
