# Maintainer: Giovanni Santini <giovannisantini93@yahoo.it>
# Contributor: Ognjen Vidovic <ognjen.vidovic at gmail dot com>
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: fes0
# Contributor: Rodrigo Coacci <rcoacci@gmail.com>
pkgname=chm2pdf
pkgver=0.9.1
pkgrel=5
pkgdesc="A simple Python script that converts CHM files into PDF files."
arch=('any')
url="http://code.google.com/p/chm2pdf/"
license=('GPL2')
depends=('htmldoc' 'python2-pychm')
optdepends=('python2-beautifulsoup3: makes HTML files of CHM standards compliant')
changelog="Changelog"
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('204293c264c94bd17f56925d21d20b9f69a96136836198ba1a5014fe128ec3b0')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	# python2 fix
	sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' chm2pdf
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python2 setup.py install --root="$pkgdir"
}
