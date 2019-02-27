# Maintainer: Developpix <developpix@gmail.com>
pkgname=jmonkeyplatform
pkgver=3.2.2
pkgrel=1
pkgdesc="A complete 3D game development suite written purely in Java."
arch=('any')
url="http://jmonkeyengine.org"
license=('BSD')
provides=('jmonkeyplatform')
conflicts=('jmonkeyplatform')
source=(
  "https://github.com/jMonkeyEngine/sdk/releases/download/v${pkgver}-stable-sdk1/jmonkeyplatform.zip"
  "${pkgname}.desktop"
  "${pkgname}.png"
)
sha512sums=(
  '0d783874e6c12406edd6a09f41edf75fa25113c7738ad3244a8bdc0db17368ed9d25b7debea9d3bcd60e186a37b1490ba528a1ea26325b3bc20c269b57d01c25'
  'cfe365bd9eb8339f6f8ba840c92dfd8ce14e035b73311d785492eab941bc519b64da7645b0d2df668052f7287030e63c56bd12be12a3809ce00ebe7318a3692a'
  'ff02936a70abab71026ba3cb6411a617dc5cb806ac4c1079d9e3118b48847da292c346ec49ca93393a030332a8062b626f5b2332f0f87384d3c34d2e66911fb8'
  )

prepare() {
  unzip jmonkeyplatform.zip -d "${srcdir}/${pkgname}"
}

package() {
  install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/${pkgname}.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps" "${srcdir}/${pkgname}.png"
  install -dm755 "${srcdir}/${pkgname}" "${pkgdir}/opt/${pkgname}"
  cp -R "${srcdir}/${pkgname}" "${pkgdir}/opt/"
}

post_install() {
  rm -rf "${srcdir}"
  rm -rf "${pkgdir}"
}