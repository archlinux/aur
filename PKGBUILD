# Maintainer: graysky <therealgraysky AT protonmail DOT com>

pkgname=flac2all
_commit=ffc9dc6762c1cb5249f497e20378081d40f60f85
pkgver=5.5
pkgrel=2
pkgdesc="Multi-threaded audio converter of FLAC to either Ogg Vorbis or MP3 retaining all tags and metadata."
arch=('any')
url="https://github.com/ZivaVatra/flac2all"
license=('GPL2')
makedepends=('python' 'python-setuptools')
depends=('flac' 'python-importlib-metadata' 'python-pyzmq')
optdepends=(
'faad2: for AAC support'
'ffmpeg: for supporting all the audio encoders it supports'
'lame: for mp3 support'
'opus-tools: for opus support'
'python-curses-menu: for the curses interface'
'python-pyzmq: for clustering'
'vorbis-tools: for ogg support'
)
source=("https://github.com/ZivaVatra/$pkgname/archive/$_commit.tar.gz"
)
sha256sums=('c05b5c8e8ba104cb186ffc00a247908f312fdcf193f696b0361d91519c63146d')

prepare() {
  cd "$pkgname-$_commit"
}

build() {
  cd "$pkgname-$_commit"
  python setup.py build
}

package() {
  cd "$pkgname-$_commit"
  python setup.py install --root="$pkgdir" --optimize=1
}

