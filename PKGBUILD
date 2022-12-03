# Maintainer: Tom Gurion <nagasaki45@gmail.com>
pkgname='behavioral-observation-research-interactive-software'
pkgver=7.13.9
pkgrel=1
pkgdesc='BORIS: a free, versatile open-source event-logging software for video/audio coding and live observations'
arch=('any')
url="http://www.boris.unito.it/"
license=('GPL2')
depends=('python>=3.6' 'vlc' 'ffmpeg' 'python-pyqt5' 'python-matplotlib' 'python-intervals')
optdepends=('graphviz: For generating transition flow graph')
source=("boris-$pkgver.tar.gz::https://github.com/olivierfriard/boris/archive/v$pkgver.tar.gz"
        "boris.run"
        "boris.desktop"
        "icon.icns")
install="boris.install"
md5sums=('808459715161c80f4b2725675c912b97'
         '84eac4973fcb93f51670f8cb7c263273'
         'edec9dc79614a03901ea4108eb4819e2'
         '97d978a3a708fd368e231462528950db')

package() {
  cd "$srcdir/BORIS-$pkgver"
  find . -type d -exec install -d {} "$pkgdir/usr/share/boris/{}" \;
  find . -type f -exec install -m 644 -D {} "$pkgdir/usr/share/boris/{}" \;

  cd "$srcdir"
  install -m 755 -D "boris.run" "$pkgdir/usr/bin/boris"
  install -m 644 -D "boris.desktop" "$pkgdir/usr/share/applications/boris.desktop"
  install -m 644 -D "icon.icns" "$pkgdir/usr/share/boris/icon.icns"
}
