# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-mpris_server
_name=${pkgname#python-}
pkgver=0.9.6
pkgrel=1
epoch=1
pkgdesc="Integrate MPRIS Media Player support into your app"
arch=('any')
url="https://github.com/alexdelorenzo/mpris_server"
license=('AGPL-3.0-or-later')
depends=(
  'python-emoji'
  'python-gobject'
  'python-pydbus'
  'python-strenum'
  'python-unidecode'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4f465e0d089820084a47c6b0de2bf7aedc3373e4743d342e221ebe1e2e2b2074')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
