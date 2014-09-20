pkgname=mps-youtube-git
pkgver=0.01.46.r2.g4527981
pkgrel=1

pkgdesc="Terminal based YouTube jukebox with playlist management"
url='https://github.com/np1/mps-youtube'
arch=('any')
license=('GPL3')

depends=('python' 'python-pafy-git')
optdepends=('mpv: Alternative to mplayer for playback'
            'mplayer: Alternative to mpv for playback')

conflicts=('mps-youtube')

install=mps-youtube-git.install
source=('git+https://github.com/np1/mps-youtube.git')

md5sums=('SKIP')

pkgver() {
	cd mps-youtube
	git describe --tags --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
	cd mps-youtube
	python setup.py install --root="$pkgdir" --optimize=1
}
