# Maintainer: Jorge Israel Peña <jorge.israel.p@gmail.com>

pkgname=syncplay
pkgver=1.4.0
pkgrel=1
pkgdesc="synchronize watching movies on mplayer2, vlc, mpv, and mpc-hc on many computers"
arch=('any')
url="http://syncplay.pl/"
license=('custom')
depends=(python2 python2-pyside python2-twisted)
source=("https://github.com/Syncplay/syncplay/archive/v${pkgver}.tar.gz"
        syncplay@.service)
sha256sums=('37fc2b3d1d6d49e2289dcdeffcf24ebdafbc24398411cff4666e09d49405759d'
            '2033d40daad02f06eede073d0cee39fba8c70289dd71e8444d429b810438ec3a')

package() {
  cd $srcdir

  # systemd
  install -Dm644 syncplay@.service ${pkgdir}/usr/lib/systemd/system/syncplay@.service

  cd "syncplay-${pkgver}"

  make DESTDIR="$pkgdir" install
}
