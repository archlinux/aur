# Maintainer: Jan-Erik Rediger <badboy at archlinux dot us>

pkgname=sync-my-l2p
pkgver=2.2.0
pkgrel=1
pkgdesc="Sync the L2P of the RWTH Aachen with your Computer"
arch=('i686' 'x86_64')
url="http://www.sync-my-l2p.de/"
license=('GPL')
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('deb2targz')
install=sync-my-l2p.install

if [ "$CARCH" = "x86_64" ]; then
  source=("https://github.com/Sync-my-L2P/Sync-my-L2P/releases/download/v${pkgver}/sync-my-l2p_${pkgver}-0.wily_amd64.deb")
  noextract=("sync-my-l2p_${pkgver}-0.vivid1_amd64.deb")
  md5sums=('9bd94c8b20e1405977980cadc3633ab1')
  _short_arch=amd64
else
  source=("https://github.com/Sync-my-L2P/Sync-my-L2P/releases/download/v${pkgver}/sync-my-l2p_${pkgver}-0.wily_i386.deb")
  noextract=("sync-my-l2p_${pkgver}-0.vivid1_i386.deb")
  md5sums=('e07689028a428d8540a41a3a8abc4763')
  _short_arch=i386
fi

prepare() {
  deb2targz sync-my-l2p_${pkgver}-0.wily_${_short_arch}.deb
}

package() {
  tar -C $pkgdir -xf sync-my-l2p_${pkgver}-0.wily_${_short_arch}.tar.xz
}

# vim:set ts=2 sw=2 sts=2 et:
