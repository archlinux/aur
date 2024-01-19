# Maintainer: Mikhail felixoid Shiryaev mr<dot>felixoid<at>gmail<dot>com

_name=pyflame
pkgname="python-${_name}"
pkgver=0.3.1
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
  "https://files.pythonhosted.org/packages/0f/78/04a296a7488dddf81476d997d0c24f4872943501a26d02cee418b9fc53e0/${_name}-${pkgver}.tar.gz"
)
sha256sums=(
  d4d710a917bf12754675e058fb6d07c376ca52831a11f8f8d38b3426c5f06348
)


package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"LICENSE
}
