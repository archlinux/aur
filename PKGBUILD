# Maintainer: dino9193 <see my AUR profile>

pkgname=vi-fortune
pkgver=0.1
pkgrel=3
pkgdesc="Vietnamese fortune cookies for fortune-mod"
arch=('any')
url="https://github.com/dino9193/vi-fortune"
license=('GPL3')
groups=('fortune-mods')
depends=('fortune-mod')
source=("${pkgname}v0.1-beta.tar.gz::${url}/archive/refs/tags/v0.1-beta.tar.gz")
sha256sums=('625cbbef16fb9f45c55bbfcd1b951b13dc919a9bf8420a89feeca4c4e526dfdb')
_pkgname_dir="${pkgname}-${pkgver}-beta"

build() {
    cd "${srcdir}/${_pkgname_dir}" 
    strfile "vi-fortune" "vi-fortune.dat"
}

package() {
    cd "${srcdir}/${_pkgname_dir}"
    install -d -m755 "${pkgdir}/usr/share/fortune"
    install -m644 vi-fortune "${pkgdir}/usr/share/fortune/"
    install -m644 vi-fortune.dat "${pkgdir}/usr/share/fortune/"
}
