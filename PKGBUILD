# Maintainer: George Raven <GeorgeRavenCommunity PLUS pythongprof2dot AT pm DOT me>

pkgname=python-gprof2dot
_name=${pkgname#python-}
pkgdesc="Python profiling dot graph generator"
pkgver=2022.7.29
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="https://github.com/jrfonseca/gprof2dot"
license=('LGPL-3')
conflicts=()
provides=()
depends=("python-graphviz")
makedepends=('python-setuptools')
source=(
  https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz
)
b2sums=('cc96bcf0cbce2159f6a03bb1b7d3b2e89212a2acdb948fbeb947b8664ed34123102792476d16d11b7b2bdb269aef9ce54a7224a355c5390fe6010e82bc2df189')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
