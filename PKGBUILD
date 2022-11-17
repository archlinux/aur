# Maintainer: calamity <calamity dot aur at mailban dot de>
pkgname=ph-userjs-updater
pkgver=1.6.0
pkgrel=1
pkgdesc="Load or update user.js for Firefox and Thunderbird from privacy-handbuch.de"
arch=('any')
url="https://notabug.org/TotallyLeGIT/PH-userjs-updater"
license=('MIT')
depends=('curl')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "updater.patch")
sha256sums=('59ed9ef164f42668d6d34d6f2691f9493d8b5774286e98a6ba25d26ce1db656e'
            '102c3ed41af37590112111ea76dc10aa5c8c27fcd7a9320fa1a1532f2111df1c')

prepare() {
  patch --directory="${pkgname}" --forward --strip=0 --input="${srcdir}/updater.patch"
}

package() {
  cd ph-userjs-updater
  install -Dm 755 updater "${pkgdir}/usr/bin/ph-userjs-updater"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
