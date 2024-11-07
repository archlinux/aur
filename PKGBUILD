# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-managesieve
pkgver=0.8
pkgrel=1
pkgdesc='A managesieve client for remotely managing sieve scripts'
arch=('any')
url='https://gitlab.com/htgoebel/managesieve'
license=('GPL-3.0-only' 'PSF-2.0')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest-runner')
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('a8c0b668423d1eb35dd2479585795e85408a330576724684031c222e06828bbef23d3d90042b64235b5f7ec37021d9937698742d03a831c5ad8a14bc12b238df')
b2sums=('0b3734cad4bd705771339793818920c1e9daba60ad8b3e50473c8d8a18a26990303f4d863fc1822b480f3f39ee24f47a0561eadbc64cb83fa1efab9a4fee922b')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

#check() {
#  cd "$pkgname"
#
#  pytest -v
#}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
