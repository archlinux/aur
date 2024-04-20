# Maintainer: Yufan You <ouuansteve at gmail>

_pkgname=gcc-hentai
pkgname="$_pkgname-git"
pkgver=r25.4df5b09
pkgrel=1
provides=("$_pkgname")
conflicts=("$_pkgname")
pkgdesc='让你的 GCC 变得更可爱！'
arch=(any)
url='https://github.com/Mosklia/gcc-hentai'
license=('GPL-3.0-only')
makedepends=(git gettext)
source=("git+${url}")
sha256sums=(SKIP)

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$_pkgname"
    msgfmt gcc.po -o gcc.mo
}

package() {
    cd "$_pkgname"
    install -Dm644 gcc.mo -t "$pkgdir/usr/share/locale/zh_CN_hentai/LC_MESSAGES"
}
