# Maintainer: clove3am (aka: Caltlgin) <clove.dev.mailbox.org>

_pkgname='gopher2600'
pkgname="${_pkgname}-bin"
pkgver=0.51.0
pkgrel=1
pkgdesc='Emulator for the Atari 2600 games console'
arch=('x86_64')
url='https://github.com/JetSetIlly/Gopher2600'
license=('GPL-3.0-or-later')
depends=(
  'gcc-libs'
  'glibc'
  'libgl'
  'sdl2'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
  "https://github.com/JetSetIlly/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_linux_amd64"
  'gopher2600.desktop'
  'icon256.png'
)
sha256sums=('f8027eef471bc081009121ff57968a191f194f413567f12627843fa755f70173'
            '5a7e3c60624007a1eb9d126097590ff869fdf66512348c5938cb53a1cccd353d'
            'a5aa462653391b3861d1c50181526830903e5c32414b62aa33ddc5675a7d713c')
options=("!strip")

package() {
  install -Dm755 "${_pkgname}_linux_amd64" "${pkgdir}/usr/bin/gopher2600"
  install -Dm644 'gopher2600.desktop' -t "${pkgdir}/usr/share/applications"
  install -Dm644 'icon256.png' "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}

