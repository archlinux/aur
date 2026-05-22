# Maintainer: Swarnaditya Singh <demonkingswarn@protonmail.com>
pkgname=luffy-bin
_pkgname=luffy
pkgver=1.2.1
pkgrel=1
pkgdesc="Watch movies and series from your commandline"
arch=('x86_64' 'aarch64')
url="https://github.com/DemonKingSwarn/luffy"
license=('GPL3')
depends=(fzf yt-dlp chafa libsixel ffmpeg)
optdepends=(kitty ghostty mpv vlc)
provides=(luffy)
conflicts=()
replaces=()
backup=()
options=()
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64")
noextract=()
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
  local _bin_suffix=""
  if [[ "$CARCH" == "x86_64" ]]; then
    _bin_suffix="amd64"
  else
    _bin_suffix="arm64"
  fi

  install -Dm755 "${_pkgname}-linux-${_bin_suffix}" "${pkgdir}/usr/bin/${_pkgname}"
}
