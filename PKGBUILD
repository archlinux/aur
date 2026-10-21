# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: envolution
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Sam <dev at samarthj dot com>
pkgname=pyinstaller-hooks-contrib
pkgver=2026.9
pkgrel=1
pkgdesc="Community maintained hooks for PyInstaller"
arch=('any')
url="https://github.com/pyinstaller/pyinstaller-hooks-contrib"
license=('Apache-2.0 OR GPL-2.0-or-later')
depends=(
  'python'
  'python-cryptography'
  'python-packaging'
  'python-pytest'
  'python-wxpython'
  'python-importlib-metadata'
  'python-traitlets'
  'python-sentry_sdk'
  'python-jupyter-core'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2a420e0c19ae6d0f2cf721a963466cb9cd3d83906049ff6b8e6aa75b5cb16992')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: ts=2 sw=2 et:
