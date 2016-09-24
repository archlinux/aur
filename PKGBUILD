# Maintainer:  Polichronucci <nick at discloud dot eu>

pkgname=magnet2torrent-git
_pkgname=magnet2torrent
pkgver=0.r60.8edd5c2
pkgrel=1
pkgdesc='A command line tool that converts magnet links in to .torrent files.'
arch=('any')
url='https://github.com/LordAro/Magnet2Torrent'
license=('GPL3')
depends=('python' 'libtorrent-rasterbar>=1.1')
makedepends=('git')
source=("${pkgname}"::'git://github.com/LordAro/Magnet2Torrent.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"

  install -D Magnet2Torrent.py ${pkgdir}/usr/bin/$_pkgname
  install -m644 -D "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/readme.txt"
}
