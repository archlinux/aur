pkgname=mps-youtube-hd-git
pkgver=0.2.8.r91.g8b09b3d
pkgrel=3

pkgdesc="Terminal based YouTube jukebox, fork with HD video playback"
url='https://github.com/th0rn/mps-youtube'
arch=('any')
license=('GPL3')

depends=('python' 'python-setuptools' 'python-pafy' 'mpv')
optdepends=('ffmpeg: for transcoding downloaded content'
            'python-pyperclip: for copying content to the clipboard'
            'python-gobject: MPRIS2 support'
            'python-dbus: MPRIS2 support')

provides=('mps-youtube')
conflicts=('mps-youtube')

source=('git+https://github.com/th0rn/mps-youtube.git')

md5sums=('SKIP')

pkgver() {
    cd mps-youtube
    git describe --tags --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    cd mps-youtube
    python setup.py install --root="$pkgdir" --optimize=1
}
