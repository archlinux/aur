# Maintainer: 0xMRTT <0XMRTT@proton.me>

pkgname=python-hgchat
_name=${pkgname#python-}
pkgver=0.1.3
pkgrel=1
pkgdesc="Hugging Chat in Python"
arch=('any')
url="https://codeberg.org/Bavarder/hgchat"
license=('GPL3')
depends=( 'python-requests' 'python-requests-toolbelt')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ac103eef866bc091af0b4c2c5097c5163868acde2a86001e526b8f1d9b7384d2')

build() {
  cd "${_name}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
