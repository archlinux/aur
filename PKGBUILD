# Maintainer: Syntaxxor <syntaxxorhapsody@gmail.com>

pkgname=septabee
pkgver=B_T3
pkgrel=1
pkgdesc='A DAW built around audio sample-level parameter modulation and a ridiculous amount of optimization.'
arch=('x86_64')
url='https://septabee.nekoweb.org'
license=('LicenseRef-septabee')
depends=('vulkan-driver' 'libpipewire' 'libx11' 'libstdc++')
source=("https://septabee.nekoweb.org/important_stuff/SEPTABEE_DOWNLOADS/version_B/septabee_linux_${pkgver}.7z")
sha256sums=('bdd5c9e10bacbe2fde873b66a768a26e21592c9bdb53bfa646747b2929b1ac50')
options=(!debug)

package() {
    cd "${srcdir}/linux"
    mkdir -p "${pkgdir}/opt/septabee"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/licenses/septabee"
    cp -R "." "${pkgdir}/opt/septabee"
    ln -s "/opt/septabee/septabee" "${pkgdir}/usr/bin/septabee"
    echo "Copyright 2026 Lost Robot\nFree for everyone to use forever\n" >> "${pkgdir}/usr/share/licenses/septabee/LICENSE"
}
