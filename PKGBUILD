# Contributor: alium
# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=televize-git
pkgdesc="CLI aplication to watch Czech television streams"
pkgver=r46.06637c4
pkgrel=1
arch=('any')
url="https://github.com/ziima/televize"
license=('apache')
depends=('python' 'python-requests' 'python-m3u8' 'python-lxml' 'python-docopt' 'python-iso8601')
conflicts=('televize')
optdepends=('mplayer: for MPlayer backend'
'mpv: for MPV backend'
'vlc: for VLC backend')
source=("${pkgname}"::'git+https://github.com/ziima/televize.git')
md5sums=('SKIP')


pkgver() {
cd "$srcdir/${pkgname}"
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
cd ${srcdir}/${pkgname}
python setup.py install --root="$pkgdir/" --prefix=/usr
}
