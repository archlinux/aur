# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname='python-nudatus'
_module='nudatus'
pkgver='0.0.3'
pkgrel=1
pkgdesc="A tool to remove comments from Python scripts"
url="https://github.com/zanderbrown/nudatus"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/n/${_module}/${_module}-${pkgver}.tar.gz")
sha256sums=('ca2324777a10df8593eacacdd37a00e8fc780d5dc6a78cb02d6e6a5a85337ac9')


build() {
  cd "${srcdir}/${_module}-${pkgver}"

  python setup.py build
}

package() {
  cd "${srcdir}/${_module}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
