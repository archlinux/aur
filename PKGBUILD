# Contributor: Alexandre Bolelli <t3k0@live.com>
# Maintainer: Alexandre Bolelli <t3k0@live.com>

pkgname=auru-git
pkgver=r2.855ffb5
pkgrel=1
pkgdesc="AUR Utility - Check foreign packages (typically installed w/ pacman -U) for available updates in AUR and upstream websites"
arch=('any')
url='https://github.com/semeion/auru'
license=('GPL3')
depends=('python-html2text' 'curl' 'jq' 'expac')
optdepends=('fzf')
makedepends=('git')
source=('git+https://github.com/semeion/auru.git')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/auru"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/auru"
    # Install script
    install -D -m755 auru "${pkgdir}/usr/bin/auru"
}

