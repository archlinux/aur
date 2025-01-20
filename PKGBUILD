_pyname=pyexiv2
pkgname=python-${_pyname}
pkgver=2.15.3
pkgrel=1
pkgdesc="Read and write image metadata, including EXIF, IPTC, XMP, ICC Profile"
arch=(any)
url="https://github.com/LeoHsiao1/pyexiv2"
license=('GPL3')
depends=('python' 'exiv2')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=()
conflicts=('python-exiv2')
source=("https://github.com/LeoHsiao1/pyexiv2/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('b151ee676a98f93d3d26a1c7bedc41ab11fd4bb2de97327488d555d9941db9c1565eff36d8724e9ab065d83c47d6a2e029b2a4eab68ac2c8adeeeaf3b787c837')

build() {
  cd "${_pyname}-${pkgver}"
  python -m build -wn
}

package() {
  cd "${_pyname}-${pkgver}"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
