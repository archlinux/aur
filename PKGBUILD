pkgname=fortify
pkgdesc='Fortify Rust Builder is a 3D base design tool for the game Rust (http://playrust.com)'
pkgver=1.5.4
pkgrel=1
arch=('any')
url='https://rustwiki.info/39/fortify-rust-builder-download/'
license=('custom')
depends=('mono')
source=('https://www.dropbox.com/s/l552wcn9iu3nyqm/Fortify1_54linux.zip?dl=1')
sha256sums=('f195dac64416688901c5c22d0cca9f60734a11f7ac2d4277731443351c985c41')

package() {
    fortifySDest="/opt/fortify"
    fortifyDest="${pkgdir}${fortifySDest}"
    install -m 0755 -d "$fortifyDest"
    cp -r "${srcdir}/Fortify_Data" "${srcdir}/Fortify.x86" "$fortifyDest"
    chmod +x "${fortifyDest}/Fortify.x86"

    # Include symlink in system bin directory
    install -m 0755 -d "${pkgdir}/usr/bin"
    echo "!/bin/sh" > "${pkgdir}/usr/bin/fortify"
    echo "$fortifySDest/Fortify.x86" >> "${pkgdir}/usr/bin/fortify"
    chmod +x "${pkgdir}/usr/bin/fortify"
}
