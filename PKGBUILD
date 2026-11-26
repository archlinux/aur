# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-userspacefs
_name=${pkgname#python-}
pkgver=3.2.2
pkgrel=1
pkgdesc="Cross-platform user-space file systems for Python"
arch=('any')
url="https://thelig.ht/code/userspacefs"
license=('GPL-3.0-or-later')
depends=(
  'python-aiohttp'
  'python-typing_extensions'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
conflicts=('python-fusepyng')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ffbdd8f88a4eeb3b5e1f14c1508d994437f16f4c09aac223c07d35b7c6b66dbf')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
