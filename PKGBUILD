# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgbase=python-sphinx-quark-theme
pkgname=($pkgbase 'python2-sphinx-quark-theme')
pkgver=0.2.1
pkgrel=1
pkgdesc='A Sphinx theme for QTextBrowser'
arch=('any')
url='https://bitbucket.org/fk/quark-sphinx-theme'
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/q/quark-sphinx-theme/quark-sphinx-theme-0.2.1.tar.bz2")
sha256sums=(92763c8b4e019fef530887b4722895e7869d7697da22cc4e7c869d10a7061793)

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

    install -Dm644 -t $pkgdir/usr/share/licenses/$pkgname LICENSE

}

package_python2-sphinx-quark-theme() {

    cd quark-sphinx-theme-$pkgver-python2
    python2 setup.py install --root $pkgdir

    install -Dm644 -t $pkgdir/usr/share/licenses/$pkgname LICENSE

}
