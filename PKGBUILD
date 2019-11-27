# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=flacsync-git
pkgver=0.3.2.r4.gfe95e74
pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
pkgrel=3
pkgdesc="Recursively mirror a directory tree of FLAC audio files to AAC/OGG"
url="https://github.com/cmcginty/flacsync"
arch=('any')
license=('GPL')
depends=('python2' 'python2-setuptools' 'python2-pillow' 'python2-mutagen' 'flac')
makedepends=('git')
optdepends=('neroaacenc: AAC encoding'
            'neroaactag: AAC tagging'
            'vorbis-tools: OGG Vorbis encoding and tagging'
            'lame: MP3 encoding'
)
provides=('flacsync')
conflicts=('flacsync')
source=("$pkgname::git+https://github.com/cmcginty/flacsync.git")
md5sums=('SKIP')

package() {
  cd "$pkgname"
  python2 setup.py install --root=$pkgdir/ --optimize=1
}
