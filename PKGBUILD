# Maintainer: Abubakar Omer <aur@aolabs.dev>

pkgname=talanoa-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="Email that feels like a messenger. Your mail stays on your computer."
arch=('x86_64')
url="https://talanoa.email"
license=('LicenseRef-Talanoa')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'gtk3' 'gvfs' 'libcups' 'libdrm' 'libnotify' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxtst' 'mesa' 'nspr' 'nss' 'pango' 'xdg-utils')
optdepends=('gnome-keyring: keep account secrets in the system keyring')
options=('!debug' '!strip' '!emptydirs')
install=${pkgname}.install
source=("https://github.com/talanoa-email/desktop-releases/releases/download/v${pkgver}/talanoa_${pkgver}_amd64.deb"
        'LICENSE')
sha224sums=('283913d0f4e2b2322a07742cdd4a5e04715c8db9c3d90bb63477c9ce'
            'cc32da149ab7b236f9969f9e07fdb243c6db7ead53fef6c7256eca4e')

package(){
    bsdtar -xf data.tar.* -C "${pkgdir}"
    cd "${pkgdir}"
    install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 "usr/lib/talanoa/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
    install -D -m644 "usr/share/doc/talanoa/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
    rm -rf "usr/share/doc"
}
