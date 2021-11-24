# Maintainer: <max at swk-web.com>
# Maintainer: <aur at shyim.de>

pkgname=php-sw-frosh-plugin-uploader
pkgver=0.3.19
pkgrel=1
pkgdesc="Tool for uploading new plugin releases to Shopware Store"
arch=('any')
url="https://github.com/FriendsOfShopware/FroshPluginUploader"
license=('MIT')
depends=('php>=7.4.0')
source=("frosh-plugin-upload-${pkgver}.phar::https://github.com/FriendsOfShopware/FroshPluginUploader/releases/download/${pkgver}/frosh-plugin-upload.phar")
sha256sums=('14e16f6b6f419caa5bc2f014ad88652ff09d5f0123086a2f90c638890a55e073'
            '__LICENSE_SHA_SUM__')

package() {
  install -D -m 755 "${srcdir}/frosh-plugin-upload-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/frosh-plugin-upload.phar"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/frosh-plugin-upload.phar" "${pkgdir}/usr/bin/frosh-plugin-upload"
}
