# Maintainer: Alexandre Petitjean <alpetitjean at gmail dot com>

pkgname=mopidy-somafm
pkgver=2.1.0
pkgrel=1
pkgdesc="Mopidy extension for playing music from SomaFM"
arch=('any')
url="https://github.com/AlexandrePTJ/mopidy-somafm"
license=('APACHE')
depends=('mopidy>=3.0')
provides=('mopidy-somafm')
source=("mopidy-somafm-${pkgver}.tar.gz::https://github.com/AlexandrePTJ/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('7a8acec14811b75a9d08cfb703191a81')
makedepends=(python-build python-installer python-setuptools-scm)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
