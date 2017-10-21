# Maintainer: Moritz Lipp <mail@mlq.me>
pkgname=fmbt
pkgver=0.39
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
  source=(https://01.org/sites/default/files/downloads/${pkgname}/${pkgname}-${pkgver}-1.tar.gz)
md5sums=('14afd3688bf2c8376743904ab0430f76')

prepare() {
	cd "$pkgname-$pkgver-1"
}

build() {
	cd "$pkgname-$pkgver-1"
	./configure --prefix=/usr PYTHON=python2
	make
}

package() {
	cd "$pkgname-$pkgver-1"
  export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages
	make DESTDIR="$pkgdir/" install
}
