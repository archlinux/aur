# Maintainer: dreieck

_pkgname=touchegg-openrc
pkgname="${_pkgname}"
pkgver=20211018.1
pkgrel=2
pkgdesc='OpenRC init script for touchegg daemon.'
url='https://wiki.archlinux.org/title/touchegg'
license=('GPL3')
arch=('any')
depends=('touchegg-nosystemd>=2')
makedepends=()
optdepends=('openrc: To make use of this initscript.')
provides=()
replaces=()
conflicts=()
backup=()
options=('!emptydirs')
source=(
  'copying-info.txt'
  'license-gpl3.txt::https://www.gnu.org/licenses/gpl-3.0.txt'
  'touchegg.openrc-initd'
)
sha256sums=(
  '8921a140fb29beec3e9a32cfc9a85c99d1c8718db806656cc443cbaf2bee8f1a'
  '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
  '92d1a15bcd5d651a4f5fe1ffba29417bb92eb16627da87e63d32c7cb5ba41689'
)

package() {
  install -D -v -m755 "${srcdir}/touchegg.openrc-initd" "${pkgdir}/etc/init.d/touchegg"

  for _license in 'copying-info.txt' 'license-gpl3.txt'; do
    install -D -v -m644 "${srcdir}/${_license}" "${pkgdir}/usr/share/licenses/${pkgname}/${_license}"
  done
}

