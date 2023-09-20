# Maintainer: Joerg Weislogel mutoroglin [at] posteo [dot] de
# Contributor: Felix Golatofski contact [st] xdfr [dot] de
# Contributor: nicoulaj julien.nicoulaud [at] gmail [dot] com

pkgname=firefox-extension-video-download-helper
pkgver=8.0.0.6
pkgrel=2
pkgdesc='The easy way to download and convert Web videos from hundreds of YouTube-like sites.'
arch=('any')
url='https://www.downloadhelper.net'
license=('custom:proprietary')
depends=('firefox')
groups=('firefox-addons')
optdepends=('vdhcoapp: companion app, see https://www.downloadhelper.net/install-coapp'
            'vdhcoapp-bin: companion app (binary version)')
source=("license.html::https://www.downloadhelper.net/terms-of-service"
        "extension_${pkgver}-${pkgrel}.xpi::https://addons.mozilla.org//firefox/downloads/file/4157053/video_downloadhelper-${pkgver}.xpi")

noextract=("license.html"
           "extension_${pkgver}-${pkgrel}.xpi")
sha512sums=(SKIP
            '4b8f37bd4d28fce232fe4bf25ef874c99efca18ed7351a8a656a04490c63d590c3dbe81fc7bcdd739dd342d73d113f9d793ae4879e0b8c1697863d093621ba06')

package() {
  install -Dm644 extension_${pkgver}-${pkgrel}.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/{b9db16a4-6edc-47ec-a1f4-b86292ed211d}.xpi"
  install -Dm644 license.html "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}
