# Maintainer: dreieck

_pkgname=sip4-sip-provides
pkgname="${_pkgname}"
epoch=3
_pkgver=4
pkgver=4.19.25
pkgrel=1

pkgdesc="Metapackage: Depends on 'sip4' and makes 'sip4' provide 'sip'-dependency (with \$pkgver automatically bumped to the one if the installed 'sip4' during build)."
url="https://archlinux.org/packages/extra/x86_64/sip4/"
license=('custom: public domain.')

arch=(
  'any'
)

depends=(
  "sip4<5"
  "sip4>=4"
)
makedepends=()
optdepends=()
provides=(
  "sip=${pkgver}"
)
replaces=()
conflicts=()

options=('emptydirs')

source=(
  'COPYING'
)
sha256sums=(
  '90d77bbbe6aa2cfdaf6eaa3580fd1a981e0d0428ae586ac37b47aee5e67fcf12'
)

pkgver() {
  LC_ALL=C
  LANG=C
  export LC_ALL
  export LANG
  pacman -Q sip4 | cut -d ' ' -f 2 | sed -E 's|^.*:||g' | sed -E 's|-.*||'
}

package() {
  install -v -D -m644 "${srcdir}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
