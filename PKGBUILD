# Maintainer : Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=python-pytimeconv-git
pkgver=0.0.2.0.ga24ef5c
pkgrel=1
pkgdesc="A Micro package for time conversion. (GIT version)"
url="https://github.com/Ichunjo/pytimeconv"
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
source=('git+https://github.com/Ichunjo/pytimeconv.git')
sha256sums=('SKIP')

pkgver() {
  cd pytimeconv
  echo "$(git describe --long --tags | tr - . | tr -d r)"
}

build() {
  cd pytimeconv
  python -m build --wheel --no-isolation
}

package() {
  cd pytimeconv
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
