# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname="python-benchit"
_pkgname="benchit"
pkgver="0.0.6"
pkgrel=1
pkgdesc="Benchmarking tools for Python"
arch=("any")
url="https://github.com/droyed/${_pkgname}"
source=("https://github.com/droyed/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("9a3a32a424b7390ff74664d9debbb713459b4cc9abcc475f7ecbe677c87a3f6c")
license=("MIT")
depends=("python"
	 "python-pandas"
	 "python-numpy"
	 "python-py-cpuinfo"
	 "python-tqdm"
	 "python-psutil"
	 "python-matplotlib")
makedepends=('python-setuptools')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.rst' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
