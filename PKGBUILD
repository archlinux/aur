# Maintainer: Nysepho Andar <write / nysepho.pw>

pkgname=rustadmin
pkgver=02042016.210010
pkgrel=1
pkgdesc="Graphical configuration tool for Rust servers."
url="https://rustadmin.com/"
arch=('x86_64' 'i686')
license=('custom')
depends=('wine')
install=${pkgname}.install
source=("http://rustadmin.com/release/RustAdminRelease.zip"
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}")

sha256sums=('3db053609ea00110010429caa1322f0de0e35b408401c2fbf9a50271dbcc6046'
            'd0d70c438085d8ee2efa0f773a271f606b8299495dd84ac399cc136285a108d4'
            '52ee3c5bc7f3b248ef160cdb736407c46c316a1d57a7aa9e88e0953630a2f626'
            '6fd706b76017ccba3708706c7602360f0de0d533dff83ecbbace1765a8eefb02')
package() {
  mkdir -p "$pkgdir/usr/share/"
  cp -r "${srcdir}/RustAdminRelease" "${pkgdir}/usr/share/${pkgname}"
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm655 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm655 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
