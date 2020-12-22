# Maintainer: Dian M Fay <dian.m.fay@gmail.com>
_name=magic-wormhole-mailbox-server
pkgname=python-magic-wormhole-mailbox-server
pkgver=0.4.1
pkgrel=1
pkgdesc="Run a mailbox server for magic-wormhole"
arch=("any")
url="https://pypi.python.org/pypi/$_name"
license=("MIT")
depends=("python" "python-twisted" "python-autobahn" "python-service-identity")
makedepends=("python-setuptools")
optdepends=("magic-wormhole: client required to use this server")
conflicts=("${pkgname}" "${pkgname}-git")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1af10592909caaf519c00e706eac842c5e77f8d4356215fe9c61c7b2258a88fb')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 || return 1
}
