# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname="python-pythondialog-docs"
pkgver=3.5.3
pkgrel=1
pkgdesc="Documentation for Python pythondialog module."
arch=('any')
url="http://pythondialog.sourceforge.net/"
license=('LGPL')
makedepends=('python-sphinx' 'python-sphinx_rtd_theme')
source=("${pkgname}-${pkgver}.tar.bz2::https://sourceforge.net/projects/pythondialog/files/pythondialog/${pkgver}/python3-pythondialog-${pkgver}.tar.bz2/download?source=files")
sha256sums=('f55fc6db1f537b07253e4a5bf0bd5d7ba343c2c2bab38f43319874edd0f0ad4b')

prepare(){
	cd "pythondialog-${pkgver}"
	sed -i "s/html_theme = 'classic'/html_theme = 'sphinx_rtd_theme'/" \
		./doc/conf.py
}

build(){
    cd "pythondialog-${pkgver}/doc"
    make html
}

package(){
    install -d "${pkgdir}/usr/share/doc/python-pythondialog"
    cd "pythondialog-${pkgver}/doc"
    cp -a _build/html "${pkgdir}/usr/share/doc/python-pythondialog/"
}
# vim:set ts=4 sw=4:
