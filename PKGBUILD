# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Michael Krauss <hippodriver@gmx.net>
# Contributor: Baptiste Jonglez <zerstorer at free dot fr>

pkgbase=python-gnuplot
pkgname=(python-gnuplot)
pkgver=1.8
pkgrel=13
pkgdesc='Plot graphs with Gnuplot'
arch=(any)
license=(LGPL)
url='https://gnuplot-py.sourceforge.net/'
depends=(python-numpy gnuplot)
makedepends=(git python-setuptools)
source=("git+https://github.com/yuyichao/gnuplot-py#commit=2c2218dc67"
        "0001-1.8-is-not-a-valid-version-number.patch")
sha256sums=('SKIP'
            '8d37967c27426669b42b7644f4c9ee3c424e99eeb46b82a6c8b6662a29781b6c')

prepare() {
  cd gnuplot-py
  patch -Np1 -i ${srcdir}/0001-1.8-is-not-a-valid-version-number.patch
}

package() {
  cd gnuplot-py

  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: ts=2 sw=2 et:
