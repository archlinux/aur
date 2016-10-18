pkgname=mps-youtube-git
pkgver=0.2.7.1.r13.g48d6b2b
pkgrel=1

pkgdesc="Terminal based YouTube jukebox with playlist management"
url='https://github.com/np1/mps-youtube'
arch=('any')
license=('GPL3')

depends=('python' 'python-setuptools' 'python-pafy-git')
optdepends=('mpv: Alternative to mplayer for playback'
            'mplayer: Alternative to mpv for playback'
            'ffmpeg: for transcoding downloaded content'
            'python-pyperclip: for copying content to the clipboard'
            'python-gobject: MPRIS2 support'
            'python-dbus: MPRIS2 support')

provides=('mps-youtube')
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
