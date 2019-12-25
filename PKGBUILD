# Maintainer: Florian Moser <arch@famoser.ch>

pkgname=font-validator
pkgrel=1
pkgver=2.1.4
pkgdesc="The Font Validator validates fonts."
url="https://github.com/HinTak/Font-Validator"
arch=('x86_64')
license=('MIT')
install=''
source=(
    "https://github.com/HinTak/Font-Validator/releases/download/FontVal-${pkgver}/FontVal-${pkgver}-ubuntu-10.7-x64.tgz"
)
sha256sums=('5bad62d5a198e84b4762a5246882cd2217a192c2c251af5f717231aa673bf7ff')
depends=('gzip')

prepare() {
    gunzip -d --force FontVal-${pkgver}-ubuntu-10.7-x64.tgz
}

package() {
    install -D -m 755 "${srcdir}/FontVal-${pkgver}-ubuntu-10.7-x64/FontValidator" "${pkgdir}/usr/bin/fontvalidator"
}
