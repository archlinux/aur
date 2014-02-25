# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

pkgname=mps-youtube-git
pkgver=0.01.32.r2.g7f0feac
pkgrel=1
pkgdesc="Terminal based YouTube jukebox with playlist management"
arch=('any')
url='https://github.com/np1/mps-youtube'
license=('GPL3')
depends=('python' 'python-pafy-git')
optdepends=('mpv: Alternative to mplayer for playback'
			'mplayer: Alternative to mpv for playback')
conflicts=('mps-youtube')
install=mps-youtube-git.install
source=('git+https://github.com/np1/mps-youtube.git' 'mps-youtube-git.install')
md5sums=('SKIP'
         '60f96ac1aa29a2024d2213004636bee8')

pkgver() {
	cd mps-youtube
	git describe --tags --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
	cd mps-youtube
	python setup.py install --root="$pkgdir" --optimize=1
}
