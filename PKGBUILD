# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-userspacefs
_name=${pkgname#python-}
pkgver=3.0.0
pkgrel=1
pkgdesc="Cross-platform user-space file systems for Python"
arch=('any')
url="https://thelig.ht/code/userspacefs"
license=('GPL-3.0-or-later')
depends=('python-aiohttp' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
conflicts=('python-fusepyng')
replaces=('python-fusepyng')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7d10855c478fe059ee093f98c33797f69afe4239b6391285dfa89412503ea1c8')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
