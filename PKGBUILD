# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=exifcleaner-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="Cross-platform desktop app to clean image metadata"
arch=('x86_64')
url="https://exifcleaner.com"
license=('MIT')
depends=('libnotify'
         'nss'
         'libxss'
         'xdg-utils'
         'libappindicator-gtk3'
         'libsecret')
provides=('exifcleaner')
source=("${pkgname}-${pkgver}.deb::https://github.com/szTheory/exifcleaner/releases/download/v${pkgver}/exifcleaner_${pkgver}_amd64.deb"
        'LICENSE::https://github.com/szTheory/exifcleaner/raw/master/LICENSE')
sha256sums=('602b90d32f37172376994954db7a49e711b70485e3663a93a0fdda43fac48b68'
            '4f0d43086d8a8843370e36feea94812ddb36d1824d18abf0deec42a69e33f9b6')

package() {
  tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/usr/bin/"
  ln -s /opt/ExifCleaner/exifcleaner "${pkgdir}/usr/bin/exifcleaner"
  cd "${pkgdir}/usr/share/icons/hicolor/"
  mv 0x0 512x512
}