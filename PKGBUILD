# Maintainer: Hari Chalise <harilvfs@chalisehari.com.np>
#             https://github.com/harilvfs
# Co-Maintainer: Aethar <elliott.ashby88@gmail.com>
pkgname=yt-x-git
_pkgname=yt-x
pkgver=v0.8.7.r4.ge321147
pkgrel=1
pkgdesc="Browse youtube from your terminal"
arch=(any)
url="https://github.com/Benexl/$_pkgname"
license=('MIT')
options=(!strip)
makedepends=('git')
depends=(
  'jq'
  'curl'
  'yt-dlp'
  'fzf'
  'sh'
  'ffmpeg'
  'ttf-jetbrains-mono-nerd')
optdepends=(
  'mpv: default media player'
  'vlc: alternative media player'
  'chafa: image previews (default renderer)'
  'kitty: image previews via kitten icat'
  'viu: image previews'
  'ffmpegthumbnailer: thumbnails in the downloads extension'
  'rofi: alternative launcher'
  'libnotify: desktop notifications when not run from a terminal'
  'wl-clipboard: copy video url on Wayland'
  'xclip: copy video url on X11'
  'xdg-utils: open videos and channels in the browser'
  'gum: improved prompts and loaders'
  'bat: default pager')

source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')

provides=("$_pkgname")
conflicts=("$_pkgname")

pkgver() {
    cd "$pkgname" || exit
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}" || exit
    cd "${pkgname}" || exit
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
