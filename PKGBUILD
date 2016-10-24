# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgbase=python-sphinx-quark-theme
pkgname=($pkgbase 'python2-sphinx-quark-theme')
pkgver=0.4.0
pkgrel=1
pkgdesc='A Sphinx theme for QTextBrowser'
arch=('any')
url='https://bitbucket.org/fk/quark-sphinx-theme'
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/f5/52/00c8cc232332cd45ca2a90a273ed2c92629e125bdbda5938b3ddb5269833/quark-sphinx-theme-$pkgver.tar.bz2")
sha256sums=('39b97402c2b0aeb21cd3f571c37fc235d1a5742b8fe429526a3ee6c38a809940')

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
