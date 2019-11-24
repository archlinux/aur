# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname='python-nudatus'
_module='nudatus'
pkgver=0.0.4
pkgrel=2
pkgdesc="A tool to remove comments from Python scripts"
url="https://github.com/zanderbrown/nudatus"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
# Release is 0.0.4 is not registered on PyPI yet
#source=("https://files.pythonhosted.org/packages/source/${_module::1}/${_module}/${_module}-${pkgver}.tar.gz")
source=("${_module}-${pkgver}.tar.gz::https://github.com/ZanderBrown/nudatus/archive/${pkgver}.tar.gz")
sha256sums=('00cabe658d3542c613c2b58567a952bab915762b240c8694327f45057b3cf1fc')


build() {
  cd "${srcdir}/${_module}-${pkgver}"

  python setup.py build
}

package() {
  cd "${srcdir}/${_module}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
