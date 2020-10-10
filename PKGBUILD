# Maintainer: Infernio <infernio at icloud dot com>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Nissar Chababy <funilrys at outlook dot com>
# Contributor: Thrasibule <guillaume dot horel at gmail dot com>
# Contributor: David Manouchehri <manouchehri@riseup.net>
# Contributor: Vladimir Tsanev <tsachev@gmail.com>
# Contributor: Andrew Reed <reed.996@osu.edu>
# Contributor: "Score_Under" <seejay.11@gmail.com>

pkgname=python2-lz4
_pkgname=lz4
pkgver=2.2.1
pkgrel=4
pkgdesc="LZ4 bindings for Python 2"
arch=('x86_64')
license=('BSD')
url="https://github.com/python-lz4/python-lz4"
depends=('python2' 'python2-future')
makedepends=('python2-setuptools-scm' 'python2-pkgconfig')
checkdepends=('python2-pytest' 'python2-psutil')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-${pkgver}.tar.gz")
sha512sums=('3f6400c0ac02182306fcb0e76fc78fdcec604bd89baa288c71261cce05350de244eb0d4263e4c1c1d647a529426beac409b3ff20c170c3ea19c7dd82cfae834b')

build() {
  cd "$srcdir"/$_pkgname-$pkgver
  python2 setup.py build
}

check() {
  cd "$srcdir"/$_pkgname-$pkgver
  python2 -m pytest
}

package() {
  cd $_pkgname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
