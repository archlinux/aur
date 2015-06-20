# Contributor: Adam Mckaig <adam.mckaig@gmail.com>
# Maintainer: Eric Anderson <ejona86@gmail.com>
# vim: ts=4 sts=4 et sw=4

pkgname=figleaf
pkgver=0.6.1
pkgrel=2
pkgdesc='Python code coverage analysis tool. A minimal replacement for coverage.py'
arch=('any')
url="http://pypi.python.org/pypi/figleaf/$pkgver"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("http://darcs.idyll.org/~t/projects/figleaf-$pkgver.tar.gz")
sha256sums=('04d22485db08f9f60c7de92407753423fa0f574c00211e409e8b0f9482f2f062')

prepare() {
    cd "$srcdir/figleaf-$pkgver"
    sed -i -e "s|^#\!.*/usr/bin/env python|#!/usr/bin/env python2|" \
        figleaf/annotate_sections.py
}

build() {
    cd "$srcdir/figleaf-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/figleaf-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
