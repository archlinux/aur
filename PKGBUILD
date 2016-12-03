# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgbase=python-sphinx-quark-theme
pkgname=($pkgbase 'python2-sphinx-quark-theme')
pkgver=0.4.1
pkgrel=1
pkgdesc='A Sphinx theme for QTextBrowser'
arch=('any')
url='https://bitbucket.org/fk/quark-sphinx-theme'
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/d4/b9/30c4a27fad539562c152c6940a6a1ab0ef3b0e339ad903c42980b50d6799/quark-sphinx-theme-0.4.1.tar.bz2")
sha256sums=('2eb766e0c5dcb4d837894f81dd3cdd4cb05cd689b3749e32646d6f3236a4f306')

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
