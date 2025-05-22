# Maintainer: ZephyrDRH <zephyrdrh at gmx dot de>
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=pwgen-passphrase
pkgver=1.2
pkgrel=2
pkgdesc="Secure wordlist-based passphrase generator"
arch=('any')
url="https://github.com/xmikos/pwgen-passphrase"
license=('GPL-3.0-only')
depends=('python')
makedepends=(python-build python-installer python-wheel python-setuptools)
optdepends=('python-pyqt5: copying to clipboard' 'python-regex: better regex Unicode support')
source=($pkgname.tar.gz::https://github.com/xmikos/pwgen-passphrase/archive/v$pkgver.tar.gz)
sha256sums=('f73e150946ff2a4edd5a2f5186dc143d9056bab01929598e0963ba33ddedcdc9')

build() {
  cd "$srcdir/${pkgname}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${pkgname}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
