# Maintainer: ZauJulio <zaujulio.dev@gmail.com>
pkgname=zerowhats-bin
_appname=ZeroWhats
pkgver=1.4.0
pkgrel=1
pkgdesc="A privacy-first WhatsApp Web desktop client"
arch=('x86_64')
url="https://github.com/ZauJulio/ZeroWhats"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'noto-fonts-emoji')
optdepends=('hunspell-en_us: English (US) spell checking'
            'hunspell-en_gb: English (UK) spell checking'
            'hunspell-pt-br: Portuguese (Brazil) spell checking'
            'hunspell-pt-pt: Portuguese (Portugal) spell checking'
            'hunspell-es_es: Spanish spell checking'
            'hunspell-fr: French spell checking'
            'hunspell-de: German spell checking'
            'hunspell-it: Italian spell checking'
            'wl-clipboard: paste files/images from the clipboard (Wayland)'
            'xclip: paste files/images from the clipboard (X11)')
provides=('zerowhats')
conflicts=('zerowhats')
options=('!strip')
source=("${_appname}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${_appname}_${pkgver}_amd64.deb")
# Updated automatically by the release workflow; SKIP since the hash changes per release.
sha256sums=('SKIP')

package() {
  # Unpack the Debian package straight into $pkgdir.
  bsdtar -xf "${srcdir}/${_appname}_${pkgver}_amd64.deb" -C "${srcdir}"
  bsdtar -xf "${srcdir}"/data.tar.* -C "${pkgdir}"
}
