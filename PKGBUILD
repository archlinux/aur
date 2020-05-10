# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Tom Wagner <tom dot a dot wagner at protonmail dot com>
# Contributor: Ada Joule <ada dot fulmina at gmail dot com>

pkgname=refind-theme-dreary-git
pkgver=r16.b745a78
pkgrel=2
pkgdesc="A gloomy rEFInd theme based on evanpurkhiser/rEFInd-minimal and lukechilds/refind-ambience"
arch=('any')
url="https://github.com/dheishman/refind-dreary"
license=('none')
depends=('refind')
makedepends=('git')
source=("${pkgname}::git+https://github.com/dheishman/refind-dreary.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mkdir -p "${pkgdir}/boot/EFI/refind/themes"
    cp -r "${srcdir}/${pkgname}/highres" "${pkgdir}/boot/EFI/refind/themes/refind-dreary"

    echo 'Remember to add "include themes/refind-dreary/theme.conf" to your refind.conf file'
}
