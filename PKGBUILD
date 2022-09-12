# Maintainer: calamity <calamity dot aur at mailban dot de>
pkgname=ph-userjs-updater
pkgver=1.5.2
pkgrel=1
pkgdesc="Load or update user.js for Firefox and Thunderbird from privacy-handbuch.de"
arch=('any')
url="https://notabug.org/TotallyLeGIT/PH-userjs-updater"
license=('MIT')
depends=('curl')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "updater.patch")
sha256sums=('3f448b8f9f1e54613c97e740284483db27edcaa480c7a2530345b47fb97fab6d'
            'b258d6fea9a887c7127a8600f5ad381e5b0ddd640d6d731043005b03e15eaa3e')

prepare() {
  patch --directory="${pkgname}" --forward --strip=0 --input="${srcdir}/updater.patch"
}

package() {
  cd ph-userjs-updater
  install -Dm 755 updater "${pkgdir}/usr/bin/ph-userjs-updater"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
