# Maintainer: tinywrkb <tinywrkb@gmail.com>

_gitname=complete-alias
pkgname=bash-${_gitname}
pkgver=1.14.0
pkgrel=1
pkgdesc='automagical bash shell alias completion'
arch=(any)
url='https://repo.cykerway.com/complete-alias'
license=('GPL3')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cykerway/${_gitname}/archive/${pkgver}.tar.gz")
sha256sums=('ceb722af6c571421bc5edd604dd78913c888bf107283c9591d6cf46e5418e0c7')

package() {
  depends=('bash-completion' 'findutils' 'sed')

  cd ${_gitname}-${pkgver}
  install -Dm644 complete_alias "${pkgdir}"/usr/share/${pkgname}/complete_alias
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/${pkgname}/README.md
}
