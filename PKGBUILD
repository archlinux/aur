# Maintainer: Henry-ZHR <henry-zhr@qq.com>
pkgname=python-mdtex2html
pkgver=1.3.1
pkgrel=1
pkgdesc="python3-library to convert Markdown with included LaTeX-Formulas to HTML with MathML"
arch=('any')
url="https://github.com/polarwinkel/mdtex2html"
license=('LGPL-2.1-only')
depends=('python'
         'python-markdown'
         'python-latex2mathml')
makedepends=('git'
             'python-build'
             'python-setuptools'
             'python-wheel'
             'python-installer')
_tag='a4f2345cc0a53a4d317e46f917ed0d991ee8c9d5' # git rev-parse "v${pkgver}"
source=("${pkgname}::git+${url}.git#tag=${_tag}")
sha512sums=('SKIP')

prepare() {
  cd "${pkgname}"
  git clean -dfx
}

build() {
  cd "${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
