# Constributor: intel <intel@ss4200>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=flacsync  
pkgver=0.3.2
pkgrel=4
pkgdesc="Recursively mirror a directory tree of FLAC audio files to AAC/OGG"
url="https://github.com/cmcginty/flacsync"
arch=('any')
license=('GPL')
depends=('python2' 'python-imaging' 'mutagen' 'flac')
makedepends=('python2-distribute')
optdepends=('neroaacenc: AAC encoding'
            'neroaactag: AAC tagging'
            'vorbis-tools: OGG Vorbis encoding and tagging'
            'lame: MP3 encoding'
)
source=(https://github.com/cmcginty/flacsync/raw/master/dist/$pkgname-$pkgver.tar.gz pillow-import.patch)

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < $srcdir/pillow-import.patch
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root=$pkgdir/ --optimize=1
}

sha1sums=('8faecca0e5eb0c2f9d0ccd4be7b79148944df482'
          '3470ce6caa45abd854c0427c12e5fd844bbd84a7')
md5sums=('0985d3d00a28332734c286b7b6fda537'
         '1840daf694b5ad95e91d3012317a0897')
