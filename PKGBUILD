# Maintainer: Syntaxxor <syntaxxorhapsody@gmail.com>

pkgname=septabee
pkgver=B_T14
pkgrel=1
pkgdesc='A DAW built around audio rate parameter modulation and a ridiculous amount of optimization.'
arch=('x86_64')
url='https://septabee.nekoweb.org'
license=('LicenseRef-septabee')
depends=('vulkan-driver' 'libx11' 'libstdc++')
optdepends=('libpipewire: Audio playback via pipewire')
install=${pkgname}.install
source=("https://septabee.nekoweb.org/important_stuff/SEPTABEE_DOWNLOADS/version_B/septabee_linux_${pkgver}.7z" 'septabee.desktop')
sha256sums=('4e829b33b2cd72f8d0cad6f8eb61d6613c942c65d15835e3d0f20854fc752e5d'
            'e3b414eb7a8fa5d0b565873cb4753b79dac456e7d0b4e9bc25f1305bcf036734')
options=(!debug)

package() {
    mkdir -p "${pkgdir}/opt/septabee"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/licenses/septabee"
    mkdir -p "${pkgdir}/usr/share/applications"
    cd "${srcdir}/linux"
    cp -R "." "${pkgdir}/opt/septabee"
    cd "${srcdir}"
    cp "septabee.desktop" "${pkgdir}/usr/share/applications"
    ln -s "/opt/septabee/septabee" "${pkgdir}/usr/bin/septabee"
    echo "Copyright 2026 Lost Robot\nFree for everyone to use forever\n" >> "${pkgdir}/usr/share/licenses/septabee/LICENSE"
}
