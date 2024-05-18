# Maintainer: Adam Brenner <adam@aeb.io>
pkgname=python-command_runner
pkgver=1.6.0
pkgrel=1
pkgdesc='Platform agnostic command and shell execution tool, also allows UAC/sudo privilege elevation'
arch=('any')
url='https://github.com/netinvent/command_runner'
depends=('python' 'python-psutil')
makedepends=('python-setuptools')
license=('BSD-3-Clause')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cfee07ee442d7fb8d8f4882396d4150f862b0826b481c7d8edcf3f5be1bb7df5')

build() {
  cd ${pkgname#python-}-${pkgver}
  python setup.py build
}

package() {
  cd ${pkgname#python-}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"
}
