# Maintainer: Moritz Lipp <mail@mlq.me>
pkgname=fmbt
_pkgname=fMBT
pkgver=0.28
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
  source=(https://github.com/01org/$_pkgname/archve/v$pkgver.tar.gz)
md5sums=('29f13abe954253ec3d567a7691166d1f')

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
