# Maintainer: Jorge Israel Peña <jorge.israel.p@gmail.com>

pkgname=syncplay
pkgver=1.3.1
pkgrel=1
pkgdesc="synchronize watching movies on mplayer2, vlc, mpv, and mpc-hc on many computers"
arch=('any')
url="http://syncplay.pl/"
license=('custom')
depends=(python2 python2-pyside python2-twisted)
source=("https://github.com/Syncplay/syncplay/archive/${pkgver}.tar.gz"
        syncplay.service)
sha256sums=('c496a5b508c000956934e0c247c07f86e90f427307269efcfda07fa3a5610301'
            '7b0db4ec2731288084d788fc26e11b14166b6886f406b26e9e1c4e67ed9feb0f')

package() {
  cd $srcdir

  # systemd
  install -Dm644 syncplay.service ${pkgdir}/usr/lib/systemd/system/syncplay.service

  cd "$pkgname-${pkgver}${minor}"

  make PREFIX="$pkgdir" install
}
