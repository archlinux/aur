# Maintainer: Francois Boulogne <devel@sciunto.org>

pkgname=xboomx
pkgver=2025.02.24
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
sha512sums=('3259dad72da50f3763b86895ef0bbc5be7b17f03d16db0341d625496cc34fa2a1f04dc652309d182c28f27c152a025b30cabc807800e15939669edeaa48afce4')

build() {
  cd "$srcdir/xboomx-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/xboomx-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim: ts=2 sts=2 sw=2 et ft=sh
