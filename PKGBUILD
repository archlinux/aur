# Maintainer: Joerg Weislogel mutoroglin [at] posteo [dot] de
# Contributor: Felix Golatofski contact [at] xdfr [dot] de
# Contributor: nicoulaj julien.nicoulaud [at] gmail [dot] com

pkgname=firefox-extension-video-download-helper
pkgver=10.5.49.2
pkgrel=1
pkgdesc='The easy way to download and convert Web videos from hundreds of YouTube-like sites.'
arch=('any')
url='https://www.downloadhelper.net'
license=('LicenseRef-proprietary')
depends=('firefox')
groups=('firefox-addons')
optdepends=('vdhcoapp: companion app, see https://www.downloadhelper.net/install-coapp'
            'vdhcoapp-bin: companion app (binary version)')
source=("license.html::https://help.downloadhelper.net/article/6-what-is-vdh"
        "extension_${pkgver}-${pkgrel}.xpi::https://addons.mozilla.org/firefox/downloads/file/5014115/video_downloadhelper-${pkgver}.xpi")

noextract=("usage_conditions.html"
           "extension_${pkgver}-${pkgrel}.xpi")
sha256sums=(SKIP
            '6b2a2f953da4d52c5057872e6dc13926d3ce05e76883dcf0fb5bac40f66d7465')

package() {
  install -Dm644 extension_${pkgver}-${pkgrel}.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/{b9db16a4-6edc-47ec-a1f4-b86292ed211d}.xpi"
  install -Dm644 license.html "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}
