# Maintainer: Joerg Weislogel mutoroglin [at] posteo [dot] de
# Contributor: Felix Golatofski contact [st] xdfr [dot] de
# Contributor: nicoulaj julien.nicoulaud [at] gmail [dot] com

pkgname=firefox-extension-video-download-helper
pkgver=7.6.6
pkgrel=1
pkgdesc='The easy way to download and convert Web videos from hundreds of YouTube-like sites.'
arch=('any')
url='https://www.downloadhelper.net'
license=('custom:proprietary')
depends=('firefox')
groups=('firefox-addons')
optdepends=('vdhcoapp: companion app, see https://www.downloadhelper.net/install-coapp'
            'vdhcoapp-bin: companion app (binary version)')
source=("license.html::https://www.downloadhelper.net/terms-of-service"
        "extension.xpi::https://addons.mozilla.org//firefox/downloads/file/4040817/video_downloadhelper-${pkgver}.xpi")

noextract=("license.html"
           "extension.xpi")
sha512sums=(SKIP
            '7bf5dca9c7fc1a92a7dd9b453097d3d67a1a45d19264bb09141a463e8ce26d6d1ce0d460ef0782c416dd8649ed06938ec31430e3275f02f715f36bac774646d9')

package() {
  install -Dm644 extension.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/{b9db16a4-6edc-47ec-a1f4-b86292ed211d}.xpi"
  install -Dm644 license.html "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}
