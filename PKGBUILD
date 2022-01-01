gitname=bypass-paywalls-chrome-clean
pkgname=chromium-bypass-paywalls-clean-git
pkgver=1283.5e32942
pkgrel=1
pkgdesc="Chromium extension to bypass paywalls"
arch=('any')
url="https://gitlab.com/magnolia1234/${gitname}"
license=('unknown')
makedepends=(git)
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${gitname}"
    local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
    printf "%s" "${ver//-/.}"
}
package() {
    mkdir -p "${pkgdir}/usr/share/chromium/${gitname}"
    shopt -u dotglob
    cp -dr --no-preserve=ownership "${srcdir}/${gitname}"/* "${pkgdir}/usr/share/chromium/${gitname}/"
}
