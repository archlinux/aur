# Maintainer: Francois Boulogne <devel@sciunto.org>

pkgname=xboomx
pkgver=2026.07.27
pkgrel=1
pkgdesc="A wrapper for most common occurrences in dmenu"
url="https://github.com/sciunto-org/xboomx"
license=('GPL-2.0')
arch=('any')
depends=('python' 'python-sqlalchemy' 'dmenu')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
provides=('xboomx')
conflicts=('xboomx' 'xboomx-snilius')
source=(https://github.com/sciunto-org/xboomx/archive/refs/tags/v${pkgver}.zip)
sha512sums=('31d72ed3017b76467951cfe867553099343dcff891e102bb033d935563a374e20969709bf5c32ef92a9a1e99f2346bd00f3817d94d7576b48880c53daa92b241')

build() {
  cd "$srcdir/xboomx-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/xboomx-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: ts=2 sts=2 sw=2 et ft=sh
