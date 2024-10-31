# Contributor: ThePirate42 <aur at thepirate42 dot org>
# Maintainer: Stykers <stykers at stykers dot moe>
# Maintainer: Joseph R. Quinn <quinn period josephr at protonmail dot com>

_name=vagrant-vmware-utility

pkgname=${_name}-bin
pkgver=1.0.23
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
b2sums=('ca257ee27dd86a32942a44d3aa32c7a18f4abf549d5fa1f1b14978269b81cb329eded6cce6fe3b18ac812bec35cc296713a117ce1984271d0eb0dd01df53d2e9')

prepare() {
  mkdir -p ${srcdir}/${_name}
  bsdtar -xf "${_name}-${pkgver}-1.${arch}.rpm" -C ${srcdir}/${_name}
}

package() {
  cd ${srcdir}/${_name}

  mv etc ${pkgdir}
  mv opt ${pkgdir}
}
