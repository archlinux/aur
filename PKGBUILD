# Maintainer: witt <1989161762 at qq dot com>

pkgname=dbeaver-connection-search
pkgver=1.0.1
pkgrel=1
pkgdesc="DBeaver connection decryption query script."
arch=('any')
url="https://github.com/witt-bit/dbeaver-connection-search"
license=('Apache-2.0')
provides=("dbeaver-connection-search" "dbeaver-connection-query")
depends=('curl' 'wget' 'grep' 'jq' 'openssl' 'coreutils')
optdepends=('dbeaver' 'dbeaver-ce' 'dbeaver-git')
options=(!strip !debug)
source=(
  "${pkgname}-${pkgver}.sh::https://github.com/witt-bit/dbeaver-connection-search/releases/download/${pkgver}/dbeaver-connection-search.sh"
  "license::https://raw.githubusercontent.com/witt-bit/dbeaver-connection-search/refs/heads/main/LICENSE"
)
sha256sums=('cc6de4d81c05a9e00ebc1d82f3a4d68bd48d6c86f705ef9631a32b59c06400f5'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/licenses"

  install -m755 "${srcdir}/${pkgname}-${pkgver}.sh" "${pkgdir}/usr/bin/${pkgname}"
  # license
  install -m644 "${srcdir}/license" "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim: set sw=2 ts=2 et:
