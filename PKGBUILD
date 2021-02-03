# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname='python-nudatus'
_module='nudatus'
pkgver=0.0.5
pkgrel=1
pkgdesc="A tool to remove comments from Python scripts"
url="https://github.com/zanderbrown/nudatus"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/${_module}/${_module}-${pkgver}.tar.gz")
# In case the release is not on registered on PyPI (yet)
#source=("${_module}-${pkgver}.tar.gz::https://github.com/ZanderBrown/nudatus/archive/${pkgver}.tar.gz")
sha256sums=('ba84a8e022cb4af0f995176383f5ff9fa83d57ded3cedc6aa4db1687f88cacec')


build() {
  cd "${srcdir}/${_module}-${pkgver}"

  python setup.py build
}

package() {
  cd "${srcdir}/${_module}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
