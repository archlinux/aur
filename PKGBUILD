# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Clint Valentine <valentine.clint@gmail.com>
# Maintainer: Nathan Owens <ndowens @ artixlinux.org>

pkgname=('python-toyplot')
pkgver=0.19.0
pkgrel=1
pkgdesc="Python plotting toolkit supporting electronic publishing and reproducibility"
arch=('any')
url="http://toyplot.readthedocs.io/"
license=('custom:sandia')
depends=('python' 'python-arrow' 'python-custom_inherit'
         'python-multipledispatch' 'python-numpy'
         'python-reportlab' 'python-six')
makedepends=('python' 'python-setuptools' 'git')
options=(!emptydirs)
source=("git+https://github.com/sandialabs/toyplot#tag=v${pkgver}")
sha256sums=('SKIP')

build(){
  cd "${srcdir}/toyplot"
  python setup.py build
}

package() {
  cd "${srcdir}/toyplot"
  python setup.py install --root="${pkgdir}"/ --optimize=1

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
