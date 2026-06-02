# Maintainer: Mikhail felixoid Shiryaev mr<dot>felixoid<at>gmail<dot>com

_name=sca2d
pkgname="python-${_name}"
pkgver=0.4.0
pkgrel=1
pkgdesc='Static Code Analysis for SCAD'
arch=('any')
url='https://gitlab.com/bath_open_instrumentation_group/sca2d'
makedepends=('python-hatchling')
license=('GPL3')
provides=("python-${_name}")
conflicts=("python-${_name}")
depends=(
  'python' 'python-lark-parser' 'python-colorama' 'python-pygments' 'python-jinja' 'python-markdown'
  )
source=(
  "https://files.pythonhosted.org/packages/eb/3f/474a80aaf5882a15bd178b2cf2e1ee17ddd376779b4bd3cb6bbb5c49c690/${_name}-${pkgver}.tar.gz"
)
sha256sums=(
  418a48add8e04cfa3c9903a86f476ea81e6aefe212f572e84af1070e7c95b374
)

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m installer --destdir="${pkgdir}" "dist/${_name}-${pkgver}-py3-none-any.whl"
}
