# Maintainer: graysky <therealgraysky AT proton DOT me>
#
# Pure-Python Mastodon API client. raspisump uses this to send Mastodon DM
# alerts as an alternative/complement to email.

pkgname=python-mastodon-py
_name=Mastodon.py
_module=mastodon_py
pkgver=2.2.1
pkgrel=1
pkgdesc="Python wrapper for the Mastodon API"
arch=('any')
url="https://github.com/halcy/Mastodon.py"
license=('MIT')
depends=('python' 'python-requests' 'python-dateutil' 'python-decorator')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/m/mastodon_py/${_module}-$pkgver.tar.gz")
sha256sums=('b52c85850272b4ff7a666b87c62432c5059f25c29fb485ffa1f608938744d8a4')

build() {
  cd "${_module}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_module}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
