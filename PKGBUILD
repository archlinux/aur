# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgbase=python-sphinx-quark-theme
pkgname=($pkgbase 'python2-sphinx-quark-theme')
pkgver=0.3.2
pkgrel=1
pkgdesc='A Sphinx theme for QTextBrowser'
arch=('any')
url='https://bitbucket.org/fk/quark-sphinx-theme'
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/25/fe/0c39b0bf7356275dace198a3b00ef4589dd09f084b2b05c41bdc5848d1c9/quark-sphinx-theme-$pkgver.tar.bz2"
        'license.txt')
sha256sums=('5478ffe3ae5741da0ea5276de4cb5be49d67fcb62a2cc1940adb5849664dfc19'
            '37957261473d2d7134df224c3b77d4313aca41600a5af75e6f0a8a02c96aef16')

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

    install -Dm644 $srcdir/license.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

}

package_python2-sphinx-quark-theme() {

    cd quark-sphinx-theme-$pkgver-python2
    python2 setup.py install --root $pkgdir

    install -Dm644 $srcdir/license.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

}
