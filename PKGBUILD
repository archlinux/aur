# Maintainer: dreieck

_pkgname=sip4-sip-provides
pkgname="${_pkgname}"
epoch=1
_pkgver=4
pkgver=4.19.24
pkgrel=1

pkgdesc="Metapackage: Depends on 'sip4' and makes 'sip4' provide 'sip'-dependency (with proper \$pkgver)."
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
  pacman -Qi sip4 | grep -E '^Version[[:space:]]*:' | awk -F ':' '{print $2}' | tr -d '[[:space:]]' | sed -E 's|\-[^-]*$||'
}

package() {
  install -v -D -m644 "${srcdir}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
