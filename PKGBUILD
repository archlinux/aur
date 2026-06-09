# Maintainer: Hari Chalise <harilvfs@chalisehari.com.np>
#             https://github.com/harilvfs
# Co-Maintainer: Aethar <elliott.ashby88@gmail.com>
pkgname=yt-x-git
_pkgname=yt-x
pkgver=v0.8.6.r4.g976b047
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
  'gum'
  'chafa'
  'icat'
  'imgcat'
  'mpv'
  'kitty'
  'bat')

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
