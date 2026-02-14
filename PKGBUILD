# Maintainer: yeggis <yeggis at github dot com>
pkgname=hyprsummon-git
pkgver=r1
pkgrel=1
pkgdesc='Summon any app as a scratchpad overlay on Hyprland'
arch=('any')
url='https://github.com/yeggis/hyprsummon'
license=('MIT')
depends=('hyprland' 'jq' 'bash')
makedepends=('git')
provides=('hyprsummon')
conflicts=('hyprsummon')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd hyprsummon
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd hyprsummon
    install -Dm755 hyprsummon "${pkgdir}/usr/bin/hyprsummon"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
