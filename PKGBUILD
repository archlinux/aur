# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=exifcleaner-bin
pkgver=3.3.1
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
sha256sums=('581916126c3632a87cc3ace736ac28e854684fff10ba4368f1c29841239d7e7f'
            'a74847d1e523991859009094dca82f704240d291dea5728a59de9e419cf104ac')

package() {
  tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/usr/bin/"
  ln -s /opt/ExifCleaner/exifcleaner "${pkgdir}/usr/bin/exifcleaner"
  cd "${pkgdir}/usr/share/icons/hicolor/"
  mv 0x0 512x512
}