# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=flac2all
pkgver=4.3
pkgrel=1
pkgdesc="Multi-threaded audio converter of FLAC to either Ogg Vorbis or MP3 retaining all tags and metadata."
arch=('any')
url="https://github.com/ZivaVatra/flac2all"
license=('GPL2')
makedepends=('python2' 'python2-setuptools')
depends=('flac' 'python2')
optdepends=('lame: for mp3 support'
'vorbis-tools: for ogg support'
'opus-tools: for opus support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ZivaVatra/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('26e1f94f3165e905ab4473d82de558ec28ef64b6eb257c26ab3c66e5a71527c9')

prepare() {
  cd "$pkgname-$pkgver"
  [[ -f version ]] || echo "v$pkgver" > version
}

build() {
  cd "$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

