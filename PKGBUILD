# Maintainer: <max at swk-web.com>
# Maintainer: <aur at shyim.de>

pkgname=php-sw-frosh-plugin-uploader
pkgver=0.3.15
pkgrel=1
pkgdesc="Tool for uploading new plugin releases to Shopware Store"
arch=('any')
url="https://github.com/FriendsOfShopware/FroshPluginUploader"
license=('MIT')
depends=('php>=7.4.0')
source=("frosh-plugin-upload-${pkgver}.phar::https://github.com/FriendsOfShopware/FroshPluginUploader/releases/download/${pkgver}/frosh-plugin-upload.phar"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/FriendsOfShopware/FroshPluginUploader/${pkgver}/LICENSE")
sha256sums=('18fcdf31060f8c8236c260c02443e9661753c3416732d5bc9fd019fed996621f'
            '4548218c4b3b8ee1da3806f1b6e1d6c285a12335722add43abce71b599b6d518')

package() {
  install -D -m 644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/frosh-plugin-upload-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/frosh-plugin-upload.phar"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/frosh-plugin-upload.phar" "${pkgdir}/usr/bin/frosh-plugin-upload"
}
