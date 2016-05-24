# Maintainer: Matthew Ellison <matt+aur@arroyonetworks>
# Contributor: Ivan Cai <caizixian@users.noreply.github.com>

pkgname=python-iptables 
pkgver=0.11.0
pkgrel=1
pkgdesc='Python bindings for iptables'
arch=('x86_64' 'i686')
url='https://github.com/ldx/python-iptables'
license=('Apache')
groups=()
depends=('python' 'iptables')
makedepends=('python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('55bdd0d8e3d0b4c27e4d61bf6f21ada1e19146c0adf65e5093e254a126abcce9')

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
