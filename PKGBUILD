# Maintainer : Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=python-pyparsebluray-git
pkgver=0.1.4.0.g5e08b7f
pkgrel=1
pkgdesc="Parse and extract binary data from bluray files. (GIT version)"
url="https://github.com/Ichunjo/pyparsebluray"
arch=('any')
license=('MIT')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-wheel'
  'python-installer'
  'python-setuptools'
)
source=('git+https://github.com/Ichunjo/pyparsebluray.git')
sha256sums=('SKIP')

pkgver() {
  cd pyparsebluray
  echo "$(git describe --long --tags | tr - . | tr -d r)"
}

build() {
  cd pyparsebluray
  python -m build --wheel --no-isolation
}

package() {
  cd pyparsebluray
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
