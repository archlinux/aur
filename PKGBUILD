# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-aiofile
_name=${pkgname#python-}
pkgver=3.8.8
pkgrel=1
pkgdesc="Real asynchronous file operations with asyncio support"
arch=('any')
url="https://github.com/mosquito/aiofile"
license=('Apache-2.0')
depends=('python-caio')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('41f3dc40bd730459d58610476e82e5efb2f84ae6e9fa088a9545385d838b8a43')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
