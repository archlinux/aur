# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

pkgname=np1-mps-git
pkgver=git
pkgrel=2
pkgdesc="Terminal based jukebox with playlist management"
arch=('any')
url='https://github.com/np1/mps'
license=('GPL3')
depends=('python')
optdepends=('mpv: Alternative to mplayer for playback'
			'mplayer: Alternative to mpv for playback')
conflicts=('np1-mps')
install=np1-mps-git.install
source=('git+https://github.com/np1/mps.git' 'np1-mps-git.install')
md5sums=('SKIP'
         '26c08fc68ce960f1cc3a7f3f9157fa27')

pkgver() {
	cd mps
	git describe --tags --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
	cd mps
	python setup.py install --root="$pkgdir" --optimize=1
}
