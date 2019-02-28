# Maintainer: Gabriel Magno <gabrielmagno1@gmail.com>
# Contributor: Michał Pałubicki <maln0ir@gmx.com>

_pkgname=agate
pkgname=python-$_pkgname
pkgver=1.6.1
pkgrel=3
pkgdesc="A data analysis library that is optimized for humans instead of machines"
arch=('any')
url="http://agate.readthedocs.org/"
license=('MIT')
depends=(
    'python'
    'python-babel>=2.0'
    'python-slugify>=1.2.1'
    'python-pytimeparse>=1.1.5'
    'python-parsedatetime>=2.1'
    'python-isodate>=0.5.4'
    'python-leather>=0.3.2'
    'python-six>=1.9.0'
  )
makedepends=(
    'python-setuptools'
    'python-sphinx>=1.2.2'
    'python-sphinx_rtd_theme>=0.1.6'
  )
source=("https://github.com/wireservice/agate/archive/${pkgver}.tar.gz")
sha256sums=('0397d3dcc6ae78b8289294b3bca15b2a7328b9015aed8841bc650700fe2a6cad')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  python setup.py build_sphinx
  mkdir -p "$pkgdir/usr/share/doc"
  cp -rv "$srcdir/$_pkgname-$pkgver/build/sphinx/html" "$pkgdir/usr/share/doc/$_pkgname"
}

# vim:set ts=2 sw=2 et:
