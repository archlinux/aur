# Maintainer: Mikhail felixoid Shiryaev mr<dot>felixoid<at>gmail<dot>com

_name=hatch-babel
pkgname="python-${_name}"
pkgver=0.1.2
pkgrel=1
pkgdesc='A hatch build-hook to compile Babel *.po files to *.mo files at build time.'
arch=('any')
url='https://pypi.org/project/hatch-babel/'
depends=('python' 'python-hatchling' 'python-babel')
license=('MIT')
source=(
  "https://files.pythonhosted.org/packages/4a/e9/7ccde937bcf8179d50402c950d0b50734d4deb100469f40c7f515008164a/hatch_babel-0.1.2.tar.gz"
)
sha256sums=(
  ae6c18dffd460d1a08650949338212880c025a3ff36e95b49b62bbe1dd9f3b87
)

build() {
  cd "${srcdir}/${_name//-/_}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name//-/_}-${pkgver}"
  python -m installer --destdir="${pkgdir}" "dist/${_name//-/_}-${pkgver}-py3-none-any.whl"
}
