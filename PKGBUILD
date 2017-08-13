# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgbase=python-sphinx-quark-theme
pkgname=($pkgbase 'python2-sphinx-quark-theme')
pkgver=0.5.0
pkgrel=1
pkgdesc='A Sphinx theme for QTextBrowser'
arch=('any')
url='https://bitbucket.org/fk/quark-sphinx-theme'
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/30/e7/2c9b618589dee281bd7991bbe7ee2fa8fb76ac0f91a5b8fa74134f6c4f00/quark-sphinx-theme-0.5.0.tar.bz2")
sha256sums=('da144c1b264344ba71fab5096687b03a226f9ea27a8c1a29a85456a87a7935ed')

prepare() {
    cp -r quark-sphinx-theme-$pkgver quark-sphinx-theme-$pkgver-python2
}

build() {

    cd $srcdir/quark-sphinx-theme-$pkgver
    python setup.py build

    cd $srcdir/quark-sphinx-theme-$pkgver-python2
    python2 setup.py build

}

package_python-sphinx-quark-theme() {

    cd quark-sphinx-theme-$pkgver
    python setup.py install --root $pkgdir --optimize=1

    install -Dm644 $srcdir/quark-sphinx-theme-$pkgver/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

}

package_python2-sphinx-quark-theme() {

    cd quark-sphinx-theme-$pkgver-python2
    python2 setup.py install --root $pkgdir

    install -Dm644 $srcdir/quark-sphinx-theme-$pkgver-python2/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

}
