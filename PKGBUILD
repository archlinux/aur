# Maintainer: Chris Mullins <christopher.r.mullins gmail>

_pkgname=bashcaster
pkgname=${_pkgname}-git
pkgver=r7.5c2e454
pkgrel=1
pkgdesc="Bashcaster is a simple script that uses ffmpeg to record screencasts to videos or GIFs. It can record the whole screen or a window. It can optionally optimize GIFs with gifsicle.
"
arch=("any")

url="https://github.com/alphapapa/bashcaster"
license=("GPL3")

depends=("ffmpeg" "xorg-xprop" "xorg-xwininfo" "yad")
optdepends=("gifsicle")
makedepends=("git")
conflicts=("${_pkgname}")

source=(
    "${_pkgname}::git+https://github.com/alphapapa/${_pkgname}.git"
)
sha512sums=(
    "SKIP"
)
pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${_pkgname}"

    install -m755 -D "bashcaster.sh" "$pkgdir/usr/bin/bashcaster"
    install -m644 -D "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
