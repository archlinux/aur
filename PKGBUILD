# Maintainer: la Fleur <lafleur at boum dot org>
# Contributor: Ivan Cai <caizixian@users.noreply.github.com>

pkgname=python-iptables 
pkgver=1.0.0
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
source=("https://github.com/ldx/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('f0193c73a7300b7ffd7a2b3dab2692b6358168b9162ab03271e9adff720c9503')

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
