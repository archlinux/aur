# Contributor: Adrian C. <anrxc..sysphere.org>

pkgname=play-git
_pkgname=play
pkgver=r44.3617f05
pkgrel=1
pkgdesc="Curses front-end for various audio players based on cplay"
arch=("any")
url="https://git.sysphere.org/play"
license=("GPL2")
depends=("ncurses" "python")
makedepends=("git")
optdepends=("mpg123: for minimal mp3 support"
            "python-stagger: for mp3 ID3 tags support"
            "vorbis-tools: for minimal ogg and flac support"
            "mplayer: for proper flac, wma, m4a and m4b support")
source=(${pkgname}::git+${url})
sha256sums=('SKIP')


pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package()
{
  cd "${srcdir}"

# Install the play binary
  install -D -m755 "${pkgname}/${_pkgname}.py" "${pkgdir}/usr/bin/${_pkgname}.py"

# Install the documentation
  install -D -m644 "${pkgname}/README" "${pkgdir}/usr/share/doc/${_pkgname}/README"
}

