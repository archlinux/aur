# Maintainer: Syntaxxor <syntaxxorhapsody@gmail.com>

pkgname=septabee
pkgver=B_T27
pkgrel=2
pkgdesc='A DAW built around audio rate parameter modulation and a ridiculous amount of optimization.'
arch=('x86_64')
url='https://septabee.nekoweb.org'
license=('LicenseRef-septabee')
depends=('vulkan-driver' 'libx11' 'libstdc++')
optdepends=('libpipewire: Audio playback via pipewire')
install=${pkgname}.install
source=("https://downloads.septabee.com/SEPTABEE_DOWNLOADS/septabee_linux_${pkgver}.7z" 'septabee.desktop')
sha256sums=('2b0a94c75ef46f82e1912d610dbc30aadfe87af783c45643a89d4cd38a02bbce'
            'e3b414eb7a8fa5d0b565873cb4753b79dac456e7d0b4e9bc25f1305bcf036734')
options=(!debug !strip)

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
