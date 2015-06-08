# Maintainer:  Polichronucci <nick at discloud dot eu>

pkgname=magnet2torrent-git
_pkgname=magnet2torrent
pkgver=0.r27.c02e075
pkgrel=1
pkgdesc='A command line tool that converts magnet links in to .torrent files.'
arch=('any')
url='https://github.com/danfolkes/Magnet2Torrent'
license=('GPL3')
depends=('python' 'python-libtorrent-rasterbar')
makedepends=('git')
source=("${pkgname}"::'git://github.com/danfolkes/Magnet2Torrent.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"

  install -D Magnet_To_Torrent2.py ${pkgdir}/usr/bin/$_pkgname
  install -m644 -D "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/readme.txt"
}
