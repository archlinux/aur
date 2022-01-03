pkgname=firefox-extension-kdeconnect
pkgver=0.1.6
pkgrel=1
pkgdesc='kdeconnect addon for firefox.'
arch=('x86_64')
url='https://addons.mozilla.org/en-US/firefox/addon/kde_connect/'
license=('GPLV3')
depends=('firefox' 'kdeconnect')
makedepends=('expect')
groups=('firefox-addons')
source=('extension.xpi::https://addons.mozilla.org/firefox/downloads/file/805784/kde_connect-${pkgver}-an+fx-linux.xpi'
        "https://github.com/pdf/kdeconnect-chrome-extension/releases/download/v${pkgver}/kdeconnect-chrome-extension-v${pkgver}-linux_amd64.tar.xz")
sha512sums=('SKIP' 'SKIP')

build() {
  cd ../
  ./script.exp  # auto install with fake keystrokes
}

package() {
  install -Dm644 extension.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/kde-connect@0xc0dedbad.com.xpi"
}

