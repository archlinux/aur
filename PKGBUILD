# Maintainer:
# Contributor: leuko <aur202307_et_aydos_de>

pkgname="xpra-html5"
pkgver=20
pkgrel=1
pkgdesc="HTML5 client for Xpra"
url="https://github.com/Xpra-org/xpra-html5"
license=('MPL-2.0')
arch=('x86_64')

conflicts=("${pkgname}-git")

makedepends=(
  'git'
  'python'
  'brotli'    # compression for served files (.br)
  'gzip'      # compression for served files (.gz)
  'uglify-js' # for compressing Javascript
)

source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('fe710c3df84c34a55fdde21f8eda82437ef9fe457fcc0bf1ff6f138ab6b4ab3d')

package() {
  cd "${pkgname}-${pkgver}"

  # custom script, *not* based on python-setuptools
  python setup.py install "${pkgdir}" # `args[2]` is `root_dir`
}
