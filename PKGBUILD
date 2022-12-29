# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Zaedus <thezaedus@proton.me>
_pkgname="youtube-tui"
pkgname="${_pkgname}-nodefaults-bin"
pkgver=0.6.0
pkgrel=1
pkgdesc="An aesthetically pleasing TUI frontend to browsing YouTube written in Rust. (Binary)"
arch=('x86_64')
url="https://github.com/Siriusmart/youtube-tui"
license=('GPL3')
depends=('libsixel' 'libxcb')
optdepends=(
  'mpv: default video player'
  'konsole: default terminal emulator'
  'yt-dlp: default youtube downloader'
)
makedepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}::https://github.com/Siriusmart/youtube-tui/releases/download/v${pkgver}/${_pkgname}-nodefaults_arch-x86_64")
sha512sums=('1729ee091dcc264f81ff6a901409fdad6c123a26dc5c2c22d4e2319bade82898f7853479b1e496e86db1127592f42fec310cb34310019ff7c023cd5a5affddd8')

package() {
  cd "${srcdir}"
  install -Dm 755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}
