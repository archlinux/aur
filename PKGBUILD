# Maintainer: coxackie <kostas.kardaras@gmail.com>

pkgname=openfootmanager-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Open-source football management simulation game"
arch=('x86_64')
url="https://github.com/openfootmanager/openfootmanager"
license=('GPL-3.0-or-later')
depends=('webkit2gtk-4.1' 'gtk3')

source=(
    "Openfoot.Manager_${pkgver}_amd64.deb::https://github.com/openfootmanager/openfootmanager/releases/download/v${pkgver}/Openfoot.Manager_${pkgver}_amd64.deb"
)

sha256sums=('23584354aee549d098392315810d67e5fd7fece9f8f2ad5b1058c1e6cd2e5aad')

package() {
    bsdtar -xOf "${srcdir}/Openfoot.Manager_${pkgver}_amd64.deb" data.tar.gz \
        | bsdtar -xpf - -C "${pkgdir}"
}
