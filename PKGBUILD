# Maintainer: Joerg Weislogel <mutoroglin [at] posteo [dot] de>
# Contributor: Felix Golatofski <contact@xdfr.de>

pkgname=firefox-extension-video-download-helper
pkgver=7.6.0
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
        "extension.xpi::https://addons.mozilla.org/firefox/downloads/file/3804074/video_downloadhelper-${pkgver}-fx.xpi")
noextract=("license.html"
           "extension.xpi")
sha512sums=(SKIP
            '1a56c8169aa2493ee33b636607f49cab8994002c9346d1a045d418a5064040f55350d781d6273ad7351ed7c620b7bd5f8629c3381e5f326eca44a4cf385f359e')

package() {
  install -Dm644 extension.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/{b9db16a4-6edc-47ec-a1f4-b86292ed211d}.xpi"
  install -Dm644 license.html "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}
