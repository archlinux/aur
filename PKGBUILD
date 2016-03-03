# Maintainer: Moritz Lipp <mail@mlq.me>
pkgname=fmbt
_pkgname=fMBT
pkgver=0.30
pkgrel=1
epoch=
pkgdesc="Free Model Based tool"
arch=('x86_64' 'i686')
url="https://01.org/fmbt/"
license=('GPL')
depends=(
  'boost'
  'flex'
  'gnuplot'
  'graphviz'
  'gts'
  'imagemagick'
  'leptonica'
  'libedit'
  'libtool'
  'libxml2'
  'python'
  'python-dbus'
  'python-pexpect'
  'python-pyside-common'
  'python2'
  'python2-dbus'
  'python2-pexpect'
  'python2-pyside'
  'python2-shiboken'
  'tesseract'
  'tesseract-data-eng'
  )
  source=(https://github.com/01org/$_pkgname/archive/v$pkgver.tar.gz)
md5sums=('b7df5c2731da457b9f4ae4928d2bcb33')

prepare() {
	cd "$_pkgname-$pkgver"
}

build() {
	cd "$_pkgname-$pkgver"
  ./autogen.sh
	./configure --prefix=/usr PYTHON=python2
	make
}

package() {
	cd "$_pkgname-$pkgver"
  export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages
	make DESTDIR="$pkgdir/" install
}
