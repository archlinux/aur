# Contributor: ThePirate42 <aur at thepirate42 dot org>
# Maintainer: Stykers <stykers at stykers dot moe>
# Maintainer: Joseph R. Quinn <quinn period josephr at protonmail dot com>

_name=vagrant-vmware-utility

pkgname=${_name}-bin
pkgver=1.0.24
pkgrel=1
pkgdesc="Plugin for vagrant vmware provider."
arch=('x86_64')
url="https://www.vagrantup.com/vmware/"
license=('MPL-2.0')
depends=('vagrant' 'bash')
makedepends=('libarchive')
provides=("${_name}")
conflicts=("${_name}")
source=("https://releases.hashicorp.com/${_name}/${pkgver}/${_name}-${pkgver}-1.${arch}.rpm")
install=${_name}.install
b2sums=('a8f922361807c5c567d51f2494151bd4525b475b824de72b21625cd2deb70460e0fd92e09c46f5d0906c24cb798f590326a422f09652807a89b909148b51ff4b')

prepare() {
  mkdir -p ${srcdir}/${_name}
  bsdtar -xf "${_name}-${pkgver}-1.${arch}.rpm" -C ${srcdir}/${_name}
}

package() {
  cd ${srcdir}/${_name}

  mv etc ${pkgdir}
  mv opt ${pkgdir}
}
