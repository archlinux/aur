# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Nissar Chababy <funilrys at outlook dot com>
# Contributor: Thrasibule <guillaume dot horel at gmail dot com>
# Contributor: David Manouchehri <manouchehri@riseup.net>
# Contributor: Vladimir Tsanev <tsachev@gmail.com>
# Contributor: Andrew Reed <reed.996@osu.edu>
# Contributor: "Score_Under" <seejay.11@gmail.com>

pkgname=python38-lz4
_pkgname=lz4
pkgver=3.1.10
pkgrel=7
pkgdesc="LZ4 bindings for Python"
arch=('x86_64')
license=('BSD')
url="https://github.com/python-lz4/python-lz4"
depends=('python38')
makedepends=('python38-setuptools-scm' 'python38-pkgconfig')
checkdepends=('python38-pytest' 'python38-psutil')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-${pkgver}.tar.gz")
sha512sums=('61983e77fa445f59503ccf8ed5fe0605d79754cdeb166e16a7093a856b23369634db7d105d57b3829e680dad0a3728adec9d18dccd92c994347b74c5af95580e')

build() {
  cd "$srcdir"/$_pkgname-$pkgver
  python3.8 setup.py build
}

check() {
  cd "$srcdir"/$_pkgname-$pkgver
  python3.8 -m pytest
}

package() {
  cd $_pkgname-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
