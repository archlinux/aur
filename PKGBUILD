# Maintainer: Tomasz Zok <tomasz dot zok at gmail dot com>
pkgname=python-isbg
_name=${pkgname#python-}
pkgver=2.3.1
pkgrel=1
pkgdesc="isbg is a script and a python 3 module that makes it easy to scan an IMAP inbox for spam using SpamAssassin and get your spam moved to another folder."
arch=(any)
url="https://isbg.gitlab.io/isbg/"
license=(GPL)
depends=(python-chardet python-docopt)
makedepends=(python-setuptools)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
md5sums=(a64acd81a04fb866fd7ae4ae566979d6)

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
