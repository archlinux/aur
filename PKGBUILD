# Maintainer: dreieck

_pkgname=mkinitcpio-uvesafb
pkgname="${_pkgname}"
pkgver=0.1
pkgrel=1
pkgdesc="mkinitcpio hook to load uvesafb module."
arch=('i686' 'x86_64')
license=('GPL2')
depends=(
  'UVESAFB-MODULE'
)
makedepends=()
provides=()
conflicts=()
optdepends=(
  'mkinitcpio: To make use of this hook.'
)
options=('!makeflags')

source=(
  'initcpio_uvesafb_install'
  'initcpio_uvesafb_hook'
)

sha256sums=(
  'd7f5d56b7e2ed2cafba7bdc1b3def5d91299974818c81bda2448fdef767c0471'
  'e1c05aabfb25d40de51555865286b22a5511ff1dc85cb7af0ab1baa896e32dd5'
)

package() {
  cd "${srcdir}"

  # Install mkinitcpio hooks
  install -D -v -m644 "initcpio_uvesafb_install" "${pkgdir}/usr/lib/initcpio/install/uvesafb"
  install -D -v -m644 "initcpio_uvesafb_hook" "${pkgdir}/usr/lib/initcpio/hooks/uvesafb"
}
