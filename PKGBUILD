pkgname=("openbox-theme-menda")
pkgver=r91.2759ebc
pkgrel=1
pkgdesc="Manjaro's Openbox theme"
arch=('any')
url="https://github.com/manjaro/artwork-menda"
conflicts=('menda-themes')
license=('GPL3')
source=(${pkgname}::'git+https://github.com/manjaro/artwork-menda.git')
sha1sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -dm755 "${pkgdir}/usr/share/themes"
  install -dm755 "${pkgdir}/usr/share/themes/Menda"

  install -Dm755 "${srcdir}/${pkgbase}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cp -r "${srcdir}/${pkgbase}/Menda/openbox-3" "${pkgdir}/usr/share/themes/Menda"
}
