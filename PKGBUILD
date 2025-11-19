# Maintainer: maryext <me@mary.my.id>

pkgname=helium-widevine
pkgdesc='A browser plugin designed for the viewing of premium video content (for Helium Browser)'
pkgver=4.10.2891.0
pkgrel=1
epoch=1
arch=('x86_64')
url='https://www.widevine.com/'
license=('custom')
options=('!strip')
depends=('gcc-libs' 'glib2' 'glibc' 'nspr' 'nss' 'helium-browser-bin')
source=(https://www.google.com/dl/release2/chrome_component/aclxnidwwkj5di3vduduj2gqpgpq_4.10.2891.0/oimompecagnajdejgnnjijobebaeigek_4.10.2891.0_linux_b4hin3q5s66ws2322cyyfp35lu.crx3)
sha256sums=('c28ebc536851070d5ecefe023e5308aacfee71d18e5b0fc27d152964d1312836')

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
