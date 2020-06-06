# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=omniawrite
pkgver=1.0.4
pkgrel=1
pkgdesc="A next-generation cross-platform plain text editor engineered for creative writing"
arch=('x86_64')
url='https://omniawrite.com'
depends=('gtk3'
         'libxss'
         'nss')
license=("custom:${pkgname}")
source=("${pkgname}-${pkgver}.rpm::https://external.omniawrite.com/download/rpm"
        'LICENSE')
sha256sums=('946ed60e34661da1cdd5247d3b40faf817db61bcf75ab9e224b8f58f5d40156d'
            'SKIP')

package() {
  cp -aR opt/ "${pkgdir}/"
  rm -rf usr/lib
  cd usr/share/icons/hicolor
  mv 0x0 512x512
  cd "${srcdir}"
  cp -aR usr/ "${pkgdir}/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}