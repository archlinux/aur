# Maintainer: Mikhail felixoid Shiryaev mr<dot>felixoid<at>gmail<dot>com

_name=pyflame
pkgname="python-${_name}"
pkgver=0.3.2
pkgrel=1
pkgdesc='Generate flamegraphs for Python code, using Brendan Gregg’s excellent FlameGraph project to perform the heavy lifting'
arch=('any')
url="https://pypi.org/project/${_name}"
makedepends=('python-setuptools')
depends=('python')
provides=('pyflame')
conflicts=('pyflame')
license=('MIT')
source=(
  "https://files.pythonhosted.org/packages/74/9e/0e750a25b3166a0e4e4f6915c1cec971c774d3ea4f84827a64323700d5ae/pyflame-0.3.2.tar.gz"
)
sha256sums=(
  8f5e5146781bddef387b33170b27cfc5be907fae0179516db564a723f30e5121
)


package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"LICENSE
}
