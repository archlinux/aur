# Maintainer: PolpOnline <aur at t0mmy dot anonaddy dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=exifcleaner-bin
pkgver=3.5.1
pkgrel=1
pkgdesc="Cross-platform desktop app to clean image metadata"
arch=('x86_64')
url="https://exifcleaner.com"
license=('MIT')
depends=('nss'
         'gtk3'
         'perl')
provides=('exifcleaner')
source=("${pkgname}-${pkgver}.deb::https://github.com/szTheory/exifcleaner/releases/download/v${pkgver}/exifcleaner_${pkgver}_amd64.deb"
        'LICENSE::https://github.com/szTheory/exifcleaner/raw/master/LICENSE')
sha256sums=('043118e435f68c8ee46d6c84d52830012e1ef4dd0dfc6d41c82b612e5b613589'
            'a74847d1e523991859009094dca82f704240d291dea5728a59de9e419cf104ac')

package() {
  tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/usr/bin/"
  ln -s /opt/ExifCleaner/exifcleaner "${pkgdir}/usr/bin/exifcleaner"
  # cd "${pkgdir}/usr/share/icons/hicolor/"
  # mv 0x0 512x512
}
