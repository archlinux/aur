pkgname=np1-mps-git
pkgver=0.20.16.r2.gbe0c8b9
pkgrel=1

pkgdesc="Terminal based jukebox with playlist management"
url='https://github.com/np1/mps'
arch=('any')
license=('GPL3')

depends=('python')
optdepends=('mpv: Alternative to mplayer for playback'
            'mplayer: Alternative to mpv for playback')

conflicts=('np1-mps')

install=np1-mps-git.install
source=('git+https://github.com/np1/mps.git')

md5sums=('SKIP')

pkgver() {
	cd mps
	git describe --tags --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
	cd mps
	python setup.py install --root="$pkgdir" --optimize=1
}
