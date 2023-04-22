# Maintainer: Henry-ZHR <henry-zhr@qq.com>
pkgname=python-mdtex2html
pkgver=1.2.0
pkgrel=1
pkgdesc="python3-library to convert Markdown with included LaTeX-Formulas to HTML with MathML"
arch=('any')
url="https://github.com/polarwinkel/mdtex2html"
license=('LGPL2.1')
depends=('python' 'python-markdown' 'python-latex2mathml')
makedepends=('git'
             'python-build' 'python-setuptools' 'python-wheel' 'python-installer')
_tag='8e8e67bd4b12fc55c29dbf53cc5dadef838506ea' # git rev-parse "v${pkgver}"
source=("${pkgname}::git+${url}.git#tag=${_tag}")
sha512sums=('SKIP')

build() {
  cd "${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
