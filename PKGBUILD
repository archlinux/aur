# Maintainer: <max at swk-web.com>
# Maintainer: <aur at shyim.de>

pkgname=php-sw-frosh-plugin-uploader
pkgver=0.3.18
pkgrel=1
pkgdesc="Tool for uploading new plugin releases to Shopware Store"
arch=('any')
url="https://github.com/FriendsOfShopware/FroshPluginUploader"
license=('MIT')
depends=('php>=7.4.0')
source=("frosh-plugin-upload-${pkgver}.phar::https://github.com/FriendsOfShopware/FroshPluginUploader/releases/download/${pkgver}/frosh-plugin-upload.phar"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/FriendsOfShopware/FroshPluginUploader/${pkgver}/LICENSE")
sha256sums=('b83d9f233bb8b62928cd065113a8f0d4828fe623cfe9148156b1dd78e07b3fa2'
            '9648e2fef7056bf270b185946a47c0284e1ccae640282fb4339b5822e47e8391')

package() {
  install -D -m 644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/frosh-plugin-upload-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/frosh-plugin-upload.phar"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/frosh-plugin-upload.phar" "${pkgdir}/usr/bin/frosh-plugin-upload"
}
