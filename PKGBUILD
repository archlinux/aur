# $Id: PKGBUILD 155944 2016-01-11 06:44:32Z fyan $
# Maintainer: Jiachen Yang <farseerfc@gmail.com>
# AUR Maintainer: Phil Schaf <flying-sheep@web.de>

_pypiname=pdfrw
pkgbase=python-pdfrw
pkgname=(python-pdfrw python2-pdfrw)
pkgver=0.2
pkgrel=4
pkgdesc='Convert restructured text to PDF via reportlab.'
arch=('any')
url="https://github.com/pmaupin/$_pypiname"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$_pypiname-$pkgver.tar.gz::https://pypi.python.org/packages/source/p/pdfrw/pdfrw-0.2.tar.gz#md5=1b46eaca5b6e0516ec682459954b210d")
md5sums=('1b46eaca5b6e0516ec682459954b210d')

prepare(){
    cp -r "$srcdir/$_pypiname-$pkgver" "$srcdir/$_pypiname-$pkgver-py2"
}

package_python-pdfrw() {
    depends=('python')
    cd "$srcdir/$_pypiname-$pkgver"
    python3 setup.py install --root="$pkgdir" -O1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

package_python2-pdfrw() {
    depends=('python2')
    cd "$srcdir/$_pypiname-$pkgver-py2"
    python2 setup.py install --root="$pkgdir" -O1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
