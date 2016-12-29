# Maintainer: Jorge Israel Peña <jorge.israel.p@gmail.com>

pkgname=syncplay
pkgver=1.4.0rc4
pkgrel=1
pkgdesc="synchronize watching movies on mplayer2, vlc, mpv, and mpc-hc on many computers"
arch=('any')
url="http://syncplay.pl/"
license=('custom')
depends=(python2 python2-pyside python2-twisted)
source=("https://github.com/Syncplay/syncplay/archive/v1.4.0-RC4.tar.gz"
        syncplay.service)
sha256sums=('6468de7fad357ae101b869b2a828c26a6aeeea86a8a14737ce796948484c1310'
            '7b0db4ec2731288084d788fc26e11b14166b6886f406b26e9e1c4e67ed9feb0f')

package() {
  cd $srcdir

  # systemd
  install -Dm644 syncplay.service ${pkgdir}/usr/lib/systemd/system/syncplay.service

  cd "syncplay-1.4.0-RC4"

  make DESTDIR="$pkgdir" install
}
