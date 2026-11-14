# Maintainer: Joerg Weislogel mutoroglin [at] posteo [dot] de
# Contributor: Felix Golatofski contact [at] xdfr [dot] de
# Contributor: nicoulaj julien.nicoulaud [at] gmail [dot] com

# query latest version with:
# curl -s 'https://addons.mozilla.org/api/v5/addons/addon/video-downloadhelper/' | jq -r '.current_version.version'
# query link to latest version with:
# curl -s 'https://addons.mozilla.org/api/v5/addons/addon/video-downloadhelper/' | jq -r '.current_version.file.url'


pkgname=firefox-extension-video-download-helper
pkgver=10.7.1.2
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
        "extension_${pkgver}-${pkgrel}.xpi::https://addons.mozilla.org/firefox/downloads/file/5236821/video_downloadhelper-${pkgver}.xpi")
noextract=("usage_conditions.html"
           "extension_${pkgver}-${pkgrel}.xpi")
sha256sums=(SKIP
            '8e9e6af61a6e8b011fdcbb5bd4bd4058a679e419e1828c7c9ae686922b2e3fa1')

package() {
  install -Dm644 extension_${pkgver}-${pkgrel}.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/{b9db16a4-6edc-47ec-a1f4-b86292ed211d}.xpi"
  install -Dm644 license.html "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}
