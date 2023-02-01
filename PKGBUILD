# Maintainer: dreieck

_pkgbase="pipewire-openrc"
pkgbase="${_pkgbase}"
pkgname=(
  'pipewire-openrc'
  'pipewire-pulse-openrc'
  'wireplumber-openrc'
)
epoch=0
pkgver=0.2
pkgrel=2
pkgdesc="A split package containing OpenRC init scripts for 'pipewire', 'pipewire-pulse' and 'wireplumber'."
arch=(
  'any'
)
url="https://aur.archlinux.org/pkgbase/pipewire-openrc"
license=('GPL2')
depends=()
optdepends=(
  'openrc: To make use of the OpenRC initscripts.'
)
makedepends=()
options+=('emptydirs')
install="${_pkgbase}.install"
source=(
  'pipewire-openrc'
  'pipewire-conf.d'
  'pipewire-pulse-openrc'
  'pipewire-pulse-conf.d'
  'wireplumber-openrc'
  'wireplumber-conf.d'
  "${install}"
)
sha256sums=(
  'f0b0dc89fd435a04183fa8dc604a8a2c4a40490559e380940ef146d691381e97'
  'e0bc441df62ced6228cd31d1087b8688311536869f95f7bc6547f2ae7a1e3231'
  '6a442662e192cbfa89b144215af86e7f7e343a36f346b38e30bbc41bddd196f4'
  '2fad4cc23b8f417e6400b4adee85389b3595ae500d3baf17d196394c8f78d8b7'
  '234b6e08915ecfa790f2f2f6fe3c76c347ab71c0194fb6df7f9c5f1de0db7e44'
  '55e9a5dcf756ea81b38e976f5d161222cd6449a4bbff67911ddfe740ff9a5727'
  'a22ccb63176088af6924c0515d8853c46454040eb07575a3337c24a26d1aff11'
)

package_pipewire-openrc() {
  pkgdesc="OpenRC init script for 'pipewire'."
  depends=(
    'pipewire'
  )
  backup=(
    'etc/conf.d/pipewire'
  )

  install -D -v -m755 "${srcdir}/pipewire-openrc" "${pkgdir}/etc/init.d/pipewire"
  install -D -v -m644 "${srcdir}/pipewire-conf.d" "${pkgdir}/etc/conf.d/pipewire"
}

package_pipewire-pulse-openrc() {
  pkgdesc="OpenRC init script for 'pipewire-pulse'."
  depends=(
    'pipewire-pulse'
  )
  backup=(
    'etc/conf.d/pipewire-pulse'
  )

  install -D -v -m755 "${srcdir}/pipewire-pulse-openrc" "${pkgdir}/etc/init.d/pipewire-pulse"
  install -D -v -m644 "${srcdir}/pipewire-pulse-conf.d" "${pkgdir}/etc/conf.d/pipewire-pulse"
}

package_wireplumber-openrc() {
  pkgdesc="OpenRC init script for 'wireplumber'."
  depends=(
    'dbus'
    'wireplumber'
  )
  backup=(
    'etc/conf.d/wireplumber'
  )

  install -D -v -m755 "${srcdir}/wireplumber-openrc" "${pkgdir}/etc/init.d/wireplumber"
  install -D -v -m644 "${srcdir}/wireplumber-conf.d" "${pkgdir}/etc/conf.d/wireplumber"
}
