# Maintainer: calamity <calamity dot aur at mailban dot de>
pkgname=ph-userjs-updater
pkgver=1.5.1
pkgrel=1
pkgdesc="Load or update user.js for Firefox and Thunderbird from privacy-handbuch.de"
arch=('any')
url="https://notabug.org/TotallyLeGIT/PH-userjs-updater"
license=('MIT')
depends=('curl')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "updater.patch")
sha256sums=('5529c31d854c5ae0b3f1388304760965eda38b3df74fb029cca3252588b13b5d'
            'fd56d6bb1dcc3327893177a701cb00cc3a6ad4319c8f3913bdf521653efe4094')

prepare() {
  patch --directory="${pkgname}" --forward --strip=0 --input="${srcdir}/updater.patch"
}

package() {
  cd ph-userjs-updater
  install -Dm 755 updater "${pkgdir}/usr/bin/ph-userjs-updater"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
