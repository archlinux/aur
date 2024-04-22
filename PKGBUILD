# Maintainer: Anakojm <https://anakojm.net/about.html>

pkgname='trackma-wrapper-git'
_pkgname=${pkgname%-git}
pkgver=r21.9505c0e
pkgrel=1
pkgdesc="Wrapper around trackma and animdl"
arch=('any')
url="https://github.com/justchokingaround/trackma-wrapper"
license=('GPL3')
depends=('mpv' 'animdl' 'trackma' 'fzf')
optdepends=('vlc: Alternative video player'
            'ani-cli: Alternative link finder')
makedepends=('git')
provides=('eztrackma')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
        cd "$srcdir/${_pkgname}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
        cd "$srcdir/${_pkgname}"
        install -Dm755 "eztrackma" "$pkgdir/usr/bin/eztrackma"
}
