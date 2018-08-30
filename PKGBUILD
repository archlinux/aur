# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=python2-dm.xmlsec.binding
pkgver=1.3.7
pkgrel=1
pkgdesc="A Cython based binding to Aleksey Sanin's XML security library to be used with lxml"
arch=('x86_64')
url='https://pypi.org/project/dm.xmlsec.binding'
license=('MIT')
makedepends=('python2-setuptools')
depends=('python2-lxml')
source=('https://files.pythonhosted.org/packages/2c/9e/7651982d50252692991acdae614af821fd6c79bc8dcd598ad71d55be8fc7/dm.xmlsec.binding-1.3.7.tar.gz')
sha256sums=('634d59acd07e5787b29f3f39e00c0b7f610154b48947de00b3e2dfd09996520e')

build() {

    cd ${srcdir}/dm.xmlsec.binding-${pkgver}
    python2 setup.py build

}

package() {

    cd dm.xmlsec.binding-${pkgver}
    python2 setup.py install --root ${pkgdir}

    install -Dm644 ${srcdir}/dm.xmlsec.binding-${pkgver}/dm/xmlsec/binding/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

}
