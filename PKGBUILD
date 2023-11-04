# Maintainer : Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=python-pyparsedvd-git
pkgver=0.0.3.0.ge2021f5
pkgrel=1
pkgdesc="Parse and extract binary data from dvd files. (GIT version)"
url="https://github.com/Ichunjo/pyparsedvd"
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
source=('git+https://github.com/Ichunjo/pyparsedvd.git')
sha256sums=('SKIP')

pkgver() {
  cd pyparsedvd
  echo "$(git describe --long --tags | tr - . | tr -d r)"
}

build() {
  cd pyparsedvd
  python -m build --wheel --no-isolation
}

package() {
  cd pyparsedvd
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
