# Maintainer: calamity <calamity dot aur at mailban dot de>
pkgname=ph-userjs-updater
pkgver=1.6.2
pkgrel=1
pkgdesc="Load or update user.js for Firefox and Thunderbird"
arch=('any')
url="https://notabug.org/TotallyLeGIT/PH-userjs-updater"
license=('MIT')
depends=('curl')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "updater.patch")
sha256sums=('342c056ec3de98717f5d2c5d2fac419c102cc20c3155e7093436cf7ccfe161c5'
            'bc6182d0db0efdb2fa035ccf9f7d5f607c2c459819a08b64e4fc1206156d6fe4')

prepare() {
  patch --directory="${pkgname}" --forward --strip=0 --input="${srcdir}/updater.patch"
}

package() {
  cd ph-userjs-updater
  install -Dm 755 updater "${pkgdir}/usr/bin/ph-userjs-updater"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
