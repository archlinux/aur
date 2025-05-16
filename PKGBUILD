# Maintainer: Bram Oosterlynck <bram.oosterlynck@gmail.com>
pkgname=python-powerline-pws
gitname=powerline-pws
pkgver=1.1.1
pkgrel=1
pkgdesc="A Powerline segment for showing the PWS station data"
arch=('any')
url="https://github.com/boosterl/powerline-pws"
license=('GPLv3')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("${pkgname}::git+https://github.com/boosterl/${gitname}.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/${pkgname}/README.md
}
