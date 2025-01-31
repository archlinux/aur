# Maintainer: Joerg Weislogel mutoroglin [at] posteo [dot] de
# Contributor: Felix Golatofski contact [st] xdfr [dot] de
# Contributor: nicoulaj julien.nicoulaud [at] gmail [dot] com

pkgname=firefox-extension-video-download-helper
pkgver=9.3.0.1
pkgrel=1
pkgdesc='The easy way to download and convert Web videos from hundreds of YouTube-like sites.'
arch=('any')
url='https://www.downloadhelper.net'
license=('LicenseRef-proprietary')
depends=('firefox')
groups=('firefox-addons')
optdepends=('vdhcoapp: companion app, see https://www.downloadhelper.net/install-coapp'
            'vdhcoapp-bin: companion app (binary version)')
source=("license.html::https://www.downloadhelper.net/terms-of-service"
        "extension_${pkgver}-${pkgrel}.xpi::https://addons.mozilla.org/firefox/downloads/file/4423892/video_downloadhelper-${pkgver}.xpi")

noextract=("license.html"
           "extension_${pkgver}-${pkgrel}.xpi")
sha512sums=(SKIP
            'db342fce9f05c2d33b047b164fb8931ffc2c22bf9e0261500a765dc9b384a5ef04b5846a8a1aaa2005b7b1e097e5dc341f5d517ab5d83d9dcd2f2dbabd8982d5')

package() {
  install -Dm644 extension_${pkgver}-${pkgrel}.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/{b9db16a4-6edc-47ec-a1f4-b86292ed211d}.xpi"
  install -Dm644 license.html "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}
