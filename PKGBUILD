# Maintainer: Jorge Israel Peña <jorge.israel.p@gmail.com>

pkgname=syncplay
_pkgver=1.5.6-Beta2
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="synchronize watching movies on mplayer2, vlc, mpv, and mpc-hc on many computers"
arch=('any')
url="http://syncplay.pl/"
license=('custom')
depends=(python python-pyside python-twisted)
source=("https://github.com/Syncplay/syncplay/archive/v${_pkgver}.tar.gz"
        syncplay@.service)
sha256sums=('afc5e05779b861ff2e9f531fef5ea7ff43dbc358e6259b0b90629462ea303e3b'
            '2033d40daad02f06eede073d0cee39fba8c70289dd71e8444d429b810438ec3a')

package() {
  cd $srcdir

  # systemd
  install -Dm644 syncplay@.service ${pkgdir}/usr/lib/systemd/system/syncplay@.service

  cd "syncplay-${_pkgver}"

  make DESTDIR="$pkgdir" install
}
