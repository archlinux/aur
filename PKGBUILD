# Maintainer: Lukas Deutz <aur at deutz dot io>

pkgname=slashbase
pkgver=0.9.0
pkgrel=1
pkgdesc="Modern database IDE for your dev & data workflows. Supports MySQL, PostgreSQL & MongoDB. Free open-source database client."
arch=('x86_64')
url="https://github.com/slashbaseide/slashbase"
license=('APACHE')
conflicts=()
depends=('gtk3' 'glibc' 'webkit2gtk' 'gdk-pixbuf2')
options=()
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/linux_amd64.zip"
        "slashbase.desktop"
        "slashbase.png")
sha256sums=('c3beb4c4724254557485c53e4090a52d061a4e6bce2ae2f9ed90f0ad042e9fc4'
            '1134b6d0bde7a77b2398201c57a6ad4a442d1d70291ba8a1863f49c92440f033'
            '35827b3f55629db3a8f772f928d02e8d9257ad160cb8fd9d0615ce94eac8a191')

package() {
  install -Dm 755 "${srcdir}/Slashbase" "${pkgdir}/usr/bin/slashbase"
  install -Dm 644 "${srcdir}/LICENSE.txt" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 "${srcdir}/slashbase.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm 644 "${srcdir}/slashbase.png" -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
}
