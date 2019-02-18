# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=flac2all
pkgver=4.1
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
sha256sums=('4fac9880264dee8512cb6756d2d3287f7e08c28ac757f96beeee6f6de5659027')

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

