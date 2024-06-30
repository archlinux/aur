# Contributor: tuftedocelot@fastmail.fm

pkgname=dswitcher-git
pkgver=12.413c983
pkgrel=1
pkgdesc='Dmenu-based window switcher for EWHM-compliant X11 window managers'
arch=('any')
url="https://github.com/Antithesisx/dswitcher"
license=('GPL-3.0-or-later')
depends=('wmctrl' 'dmenu')
makedepends=('git')
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    cd "$pkgname"
    install -Dm755 "dswitcher" -t "${pkgdir}/usr/bin"
    install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
