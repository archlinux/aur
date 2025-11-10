# Maintainer: graysky <therealgraysky AT protonmail DOT com>

pkgname=flac2all
_commit=3749424f527137f9b69e1dc70d35e1d1199e6109
pkgver=5.4
epoch=1
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
sha256sums=('f593708926aa74e4b1b2873728cd37a01c34c3f5e5df751233e22802119a43d9')

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

