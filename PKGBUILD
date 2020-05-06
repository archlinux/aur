# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-pyyaml-include
pkgver=1.2
pkgrel=1
pkgdesc='An extending constructor of PyYAML: include YAML files into YAML document'
arch=('any')
url="https://github.com/tanbro/pyyaml-include"
license=('GPL-3.0')
depends=('python' 'python-yaml')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/68/18/e774bf0e7f7cd5e9ca52edbf3cab045ca7504c2b4bc5e00c1f504b8cf34f/pyyaml-include-${pkgver}.tar.gz")
sha256sums=('2343c4dad744d3ce907ec50683b29b4383c7c967f142275bdad8ed56d4de9d94')

build() {
  cd "${srcdir}/pyyaml-include-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/pyyaml-include-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /usr/share/licenses/common/GPL3/license.txt \
   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}