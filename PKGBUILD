# Maintainer: Alex J. Malozemoff <amaloz@galois.com>
pkgname=matterhorn-bin
pkgver=50200.5.0
pkgrel=2
pkgdesc="A terminal-based chat client for MatterMost"
arch=('x86_64')
url="https://github.com/matterhorn-chat/matterhorn"
license=('BSD')
provides=('matterhorn-bin')
conflicts=('matterhorn' 'matterhorn-git')
depends=('gmp' 'libffi' 'ncurses5-compat-libs' 'zlib')
source=("https://github.com/matterhorn-chat/matterhorn/releases/download/${pkgver}/matterhorn-${pkgver}-ubuntu-18.04-bionic-$CARCH.tar.bz2"
        "LICENSE::https://github.com/matterhorn-chat/matterhorn/blob/c911e2d828fd2147b1a3f618acf4727b5c18df61/LICENSE")
sha1sums=('e4e944725c131994ae408b42cdf8ca27e2d0ab0f'
          '41bd788816973ea1340759da722bac169d6dc746')

package() {
  install -m644 -D LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  cd ${srcdir}/matterhorn-${pkgver}-ubuntu-18.04-bionic-${arch}
  install -m755 -D matterhorn ${pkgdir}/usr/bin/matterhorn

}
