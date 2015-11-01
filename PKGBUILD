gitname=eml2mbox
pkgname=${gitname}-git
pkgver=21.67dd53a
pkgrel=1
pkgdesc="Converts a bunch of eml files into one mbox file"
arch=('any')
url="https://github.com/yardenac/${gitname}"
license=('LGPL2.1')
depends=('ruby')
conflicts=($gitname)
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${gitname}"
    local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
    printf "%s" "${ver//-/.}"
}
package() {
    cd "${srcdir}/${gitname}"
    install -Dm 755 eml2mbox.rb "${pkgdir}/usr/bin/eml2mbox"
}
