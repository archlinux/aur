# Maintainer: Rubin Simons <me@rubin55.org>

pkgname=talanoa-bin
pkgver=0.7.2
pkgrel=1
pkgdesc="Talanoa is a modern email client that is designed to be fast, secure, and easy to use"
arch=('x86_64')
url="https://talanoa.email"
license=('custom')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'gtk3' 'gvfs' 'libcups' 'libdrm' 'libnotify' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxtst' 'mesa' 'nspr' 'nss' 'pango' 'xdg-utils')
optdepends=('libgnome-keyring')
options=('!debug' '!strip' '!emptydirs')
install=${pkgname}.install
source=("https://github.com/talanoa-email/desktop-releases/releases/download/v${pkgver}/talanoa_${pkgver}_amd64.deb")
sha224sums=('001e0607da7a7c59743f28ecf2d6f530b33224f6d92fae330d9c0218')

package(){
    tar -xI unzstd -f data.tar.zst -C "${pkgdir}"
    cd "${pkgdir}"
    install -D -m644 "usr/lib/talanoa/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 "usr/share/doc/talanoa/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
    rm -rf "usr/share/doc"
}
