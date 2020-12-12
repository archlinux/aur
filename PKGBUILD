# Maintainer: Pedro Mendes <pedro.mendes.26@gmail.com>

pkgname=web-xdg-open-git
pkgver=2.8
pkgrel=1
pkgdesc="A smart browser that tries to open content in the appropriate xdg app before resorting to the browser"
arch=('any')
url="https://github.com/mendess/${pkgname%-git}"
license=('GPL')
depends=(xdg-utils file curl youtube-dl coreutils)
optdepends=(libnotify mpv xclip)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
md5sums=('SKIP')

package() {
    cd "${pkgname%-git}" || exit
    make PREFIX=/usr DESTDIR="$pkgdir" install
}


# vim: ts=2 sw=2 et ft=sh:
