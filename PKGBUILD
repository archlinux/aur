# $Id: PKGBUILD 155944 2016-01-11 06:44:32Z fyan $
# Maintainer: Jiachen Yang <farseerfc@gmail.com>
# AUR Maintainer: Phil Schaf <flying-sheep@web.de>

_pypiname=pdfrw
pkgbase=python-pdfrw
pkgname=(python-pdfrw python2-pdfrw)
pkgver=0.3
pkgrel=2
pkgdesc='Convert restructured text to PDF via reportlab.'
arch=('any')
url="https://github.com/pmaupin/$_pypiname"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$_pypiname-$pkgver.tar.gz::https://pypi.python.org/packages/06/62/7f43c4a9d014b94ea03fe73088332fa07db1a03f806bac01aaa19a7fb887/pdfrw-0.3.tar.gz#md5=31209322130fdf8fde6a67a5fb117741")
md5sums=('31209322130fdf8fde6a67a5fb117741')

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
