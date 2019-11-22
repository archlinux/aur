# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=invoiceninja
pkgver=4.5.16
pkgrel=1
pkgdesc='Invoices, Expenses and Tasks built with Laravel and Flutter'
arch=('any')
url='https://www.invoiceninja.com'
license=('custom')
depends=('php')
optdepends=('mariadb')
source=("invoiceninja-$pkgver.tar.gz::https://github.com/invoiceninja/invoiceninja/archive/v${pkgver}.tar.gz"
        "invoiceninja.tmpfiles")
sha512sums=('3a2ada5a73e940373ba7d35c5633c91122578da8a0cf16c568eef87b82abd44fabf74640f0e6e56bae41c45db8f50bd3dea71dac5bd69ca9ed6afaa97f646075'
            '552cbcc62451182fcc1d04417338c72d0486b02f55ee3e6df89187e81b78cb9ba46ae4e9b9dc9b67a91933850c3aa024e79de7572063e0a58ae5c93090ca1770')

package() {
  mkdir -p "${pkgdir}/usr/share/webapps"
  cp -r "${srcdir}/invoiceninja-${pkgver}" "${pkgdir}/usr/share/webapps/invoiceninja"
  install -D "${srcdir}/invoiceninja-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 "${srcdir}/invoiceninja.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/invoiceninja.conf"
}

# vim: ts=2 sw=2 et:
