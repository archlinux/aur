# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname='python-pythondialog-docs'
pkgver=3.4.0
pkgrel=1
pkgdesc="Documentation for Python pythondialog module."
arch=('any')
url="http://pythondialog.sourceforge.net/"
license=('LGPL')
makedepends=('python-sphinx' 'python-sphinx_rtd_theme')
source=("$pkgname-$pkgver.tar.bz2::https://sourceforge.net/projects/pythondialog/files/latest/download?source=files")
sha256sums=('019cdbffe3f61d32d6fb158ce48a767478af2aac2f31fb40460b39aefae604fe')

prepare(){
	cd pythondialog-$pkgver
	sed -i "s/html_theme = 'classic'/html_theme = 'sphinx_rtd_theme'/" \
		./doc/conf.py
}

build(){
    cd pythondialog-$pkgver/doc
    make html
}

package(){
    install -d ${pkgdir}/usr/share/doc/python-pythondialog
	cd pythondialog-$pkgver/doc
    cp -a _build/html ${pkgdir}/usr/share/doc/python-pythondialog/
}
