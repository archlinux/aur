# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname="python-pythondialog-docs"
pkgver=3.5.0
pkgrel=1
pkgdesc="Documentation for Python pythondialog module."
arch=('any')
url="http://pythondialog.sourceforge.net/"
license=('LGPL')
makedepends=('python-sphinx' 'python-sphinx_rtd_theme')
source=("$pkgname-$pkgver.tar.bz2::https://sourceforge.net/projects/pythondialog/files/latest/download?source=files")
sha256sums=('51760fd3ec65fcdd3055cc53a5f0e69caabfa9ad1e0154727ca17aa313f1a605')

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
# vim:set ts=2 sw=2 et:
