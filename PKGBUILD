# Maintainer: Francois Boulogne <devel@sciunto.org>

pkgname=xboomx
pkgver=2025.02.26
pkgrel=1
pkgdesc="A wrapper for most common occurrences in dmenu"
url="https://github.com/sciunto-org/xboomx"
license=('GPL-2.0')
arch=('any')
depends=('python' 'python-sqlalchemy' 'dmenu')
makedepends=('python-setuptools')
provides=('xboomx')
conflicts=('xboomx' 'xboomx-snilius')
source=(https://github.com/sciunto-org/xboomx/archive/refs/tags/${pkgver}.zip)
sha512sums=('70aa1a62d49ae14e7af23132ea8fb33c079118ebcaa9aa024153fd1152f246ce2925f0784f3282758d5c45d59514f4b3a894c2804055cb8f3ae5f62e4fb8b8c2')

build() {
  cd "$srcdir/xboomx-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/xboomx-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim: ts=2 sts=2 sw=2 et ft=sh
