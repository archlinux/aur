# Maintainer: Wilsson Martee <wilssonm@gmail.com>

pkgname=mps-youtube-git
_pkgname=mps-youtube
pkgver=0.2.8.r163.g4c6ee0f
pkgrel=1
pkgdesc="Terminal based YouTube jukebox with playlist management - git develop release"
url='https://github.com/mps-youtube/mps-youtube'
arch=('any')
license=('GPL3')
depends=('python' 'python-setuptools' 'python-pafy')
makedepends=('git')
optdepends=('mpv: Alternative to mplayer for playback'
            'mplayer: Alternative to mpv for playback'
            'ffmpeg: for transcoding downloaded content'
            'python-pyperclip: for copying content to the clipboard')
provides=('mps-youtube')
conflicts=('mps-youtube')
install=mps-youtube-git.install
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd ${_pkgname}
	git describe --tags --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
	cd ${_pkgname}
	python setup.py install --root="$pkgdir" --optimize=1
}
