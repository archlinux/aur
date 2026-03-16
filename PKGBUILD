# Maintainer: maryext <me@mary.my.id>

pkgname=helium-widevine
pkgdesc='A browser plugin designed for the viewing of premium video content (for Helium Browser)'
pkgver=4.10.2934.0
pkgrel=1
epoch=1
arch=('x86_64')
url='https://www.widevine.com/'
license=('custom')
options=('!strip')
depends=('gcc-libs' 'glib2' 'glibc' 'nspr' 'nss' 'helium-browser-bin')
source=(https://www.google.com/dl/release2/chrome_component/accssjtqfpf5qicscrptql4jyyxa_4.10.2934.0/oimompecagnajdejgnnjijobebaeigek_4.10.2934.0_linux_ph722a3wl2goebkpserszm6bde.crx3)
sha256sums=('d36111684f13d2f76f181eb0117a873e12e4ee6f0f9a3027a9d022b787d74eb2')

package() {
  install -Dm755 "${srcdir}/_platform_specific/linux_x64/libwidevinecdm.so" \
    "${pkgdir}/opt/helium-browser-bin/WidevineCdm/_platform_specific/linux_x64/libwidevinecdm.so"
  install -Dm644 "${srcdir}/manifest.json" \
    "${pkgdir}/opt/helium-browser-bin/WidevineCdm/manifest.json"
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/opt/helium-browser-bin/WidevineCdm/LICENSE"
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # backward compatibility
  ln -s WidevineCdm/_platform_specific/linux_x64/libwidevinecdm.so "$pkgdir/opt/helium-browser-bin/libwidevinecdm.so"
}
