# Maintainer: strat <strat@jamjar.ws>

pkgname=spicetify-themes-git
pkgver=r509.3effbbe
pkgrel=1
pkgdesc="A community-driven collection of themes for spicetify"
arch=('any')
url="https://github.com/spicetify/spicetify-themes"
license=('MIT')
groups=()
depends=('spicetify-cli')
makedepends=('git')
provides=("spicetify-themes")
conflicts=("spicetify-themes")
replaces=()
backup=()
options=()
install=spicetify-themes-git.install
source=("git+$url")
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/spicetify-themes"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mkdir -p "${pkgdir}"/opt/spicetify-cli/Themes

    cd "$srcdir/spicetify-themes"
    # i cant find and elegant solution for this considering some directorys are also not suppost to be copied
    cp -r Blackout Blossom BurntSienna Default Dreary Dribbblish Flow Matte Nightlight Onepunch SharkBlue Sleek StarryNight text Turntable Ziro "${pkgdir}"/opt/spicetify-cli/Themes
    find $pkgdir -name '*.png' -delete
}
