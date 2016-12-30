# Maintainer: Jorge Israel Peña <jorge.israel.p@gmail.com>

pkgname=syncplay
pkgver=1.4.0rc4
pkgrel=2
pkgdesc="synchronize watching movies on mplayer2, vlc, mpv, and mpc-hc on many computers"
arch=('any')
url="http://syncplay.pl/"
license=('custom')
depends=(python2 python2-pyside python2-twisted)
source=("https://github.com/Syncplay/syncplay/archive/v1.4.0-RC4.tar.gz"
        syncplay@.service)
sha256sums=('6468de7fad357ae101b869b2a828c26a6aeeea86a8a14737ce796948484c1310'
            '2033d40daad02f06eede073d0cee39fba8c70289dd71e8444d429b810438ec3a')

package() {
  cd $srcdir

  # systemd
  install -Dm644 syncplay@.service ${pkgdir}/usr/lib/systemd/system/syncplay@.service

  cd "syncplay-1.4.0-RC4"

  make DESTDIR="$pkgdir" install
}
