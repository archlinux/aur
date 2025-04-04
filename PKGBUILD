# Maintainer: dreieck

_pkgname=lact-openrc
pkgname="${_pkgname}"
pkgver=20250404.01
pkgrel=1
pkgdesc='OpenRC init script for lact.'
url="https://github.com/ilya-zlobintsev/LACT"
license=('GPL-3.0-or-later')
arch=('any')
depends=('lact')
makedepends=()
optdepends=('openrc: To make use of this initscript.')
provides=()
replaces=()
conflicts=()
backup=()
options+=('!emptydirs')
source=(
  'lact.openrc-init'
  'copying-info.txt'
  'license-gpl3.txt::https://www.gnu.org/licenses/gpl-3.0.txt'
)
sha256sums=(
  'a8bd6db18d405ce08613d7bf0e96517fe30422a54e5d69d54a7bdd4d13dbe06e' # lact.openrc-init
  '55dea4a1301ea1c8dd9cfa7c7eefa6bf90bbf4ca1886c184f8517a6fd6ac6c5f' # copying-info.txt
  '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986' # license-gpl3.txt
)

package() {
  install -D -v -m755 "${srcdir}/lact.openrc-init" "${pkgdir}/etc/init.d/lact"

  for _license in 'copying-info.txt' 'license-gpl3.txt'; do
    install -D -v -m644 "${srcdir}/${_license}" "${pkgdir}/usr/share/licenses/${pkgname}/${_license}"
  done
}
