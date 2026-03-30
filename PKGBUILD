# Maintainer: Mikhail felixoid Shiryaev mr<dot>felixoid<at>gmail<dot>com

_name=pytr
pkgname="python-${_name}"
pkgver=0.4.7
pkgrel=2
pkgdesc='This is a library for the private API of the Trade Republic online brokerage.'
arch=('any')
url="https://github.com/pytr-org/pytr"
makedepends=('python-hatchling' 'python-hatch-babel')
license=('MIT')
provides=("python-${_name}")
conflicts=("python-${_name}")
depends=(
  'python' 'python-shtab' 'python-babel' 'python-websockets' 'python-requests-futures' 'python-pygments' 'python-pathvalidate'
  'python-packaging' 'python-ecdsa' 'python-coloredlogs' 'python-certifi'
  'python-cryptography' 'python-curl_cffi'
  )
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=(
  a1ec824e7e38e7598d0970a8b51d25b4f24b026f594c3a7b0fbd01e951b8fe22
)

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m installer --destdir="${pkgdir}" "dist/${_name}-${pkgver}-py3-none-any.whl"
}
