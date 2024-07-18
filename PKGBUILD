# Maintainer: graysky <therealgraysky AT protonmail DOT com>

pkgname=flac2all
_commit=2a7f2a6e8aa78a990f59fd8d9fb1594861c42baa
pkgver=5.7
pkgrel=1
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
sha256sums=('15f7e1ae56edfeb2ac13557849a2280424d54ba0125236ec40f55da4dd59ae7f')

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

