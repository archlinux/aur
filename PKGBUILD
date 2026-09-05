# Maintainer: Syntaxxor <syntaxxorhapsody@gmail.com>

pkgname=septabee
pkgver=B_T3
pkgrel=2
pkgdesc='A DAW built around audio sample-level parameter modulation and a ridiculous amount of optimization.'
arch=('x86_64')
url='https://septabee.nekoweb.org'
license=('LicenseRef-septabee')
depends=('vulkan-driver' 'libpipewire' 'libx11' 'libstdc++')
source=("https://septabee.nekoweb.org/important_stuff/SEPTABEE_DOWNLOADS/version_B/septabee_linux_${pkgver}.7z" 'septabee.desktop')
sha256sums=('bdd5c9e10bacbe2fde873b66a768a26e21592c9bdb53bfa646747b2929b1ac50'
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
