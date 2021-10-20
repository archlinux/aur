# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Anders Thomsen <mail nospamat andersthomsen nospamdot dk>

pkgname=m-air-edit-bin
pkgver=1.7
pkgrel=2
pkgdesc="Remote control program for MIDAS M-AIR mixers"
arch=('x86_64' 'armv7h')
url="https://www.midasconsoles.com/downloads.html"
license=('custom:MUSIC Group End User License Agreement')
depends=('alsa-lib' 'freetype2' 'libcurl-gnutls' 'libglvnd')
provides=('m-air-edit')
conflicts=('m-air-edit')
source=("EULA_2012-09-12.pdf"
        "m-air-edit.desktop"
        "m-air-edit.png")
source_x86_64=("https://mediadl.musictribe.com/download/software/midas/M-AIR/M-AIR-Edit_LINUX_${pkgver}.tar.gz")
source_armv7h=("https://mediadl.musictribe.com/download/software/midas/M-AIR/M-AIR-Edit_RASPI_${pkgver}.tar.gz")
sha256sums=('3321aa0b3e208133094665281a6fc2ca001628858cd1a6388185eac93569fca8'
            '7f88a5afac7e4097524797a7776f2a6619f4dae8d0cc6449fbb2e118fb6c1a7b'
            '597c3f089725e321c93b639a255f7a9cfbb8208915c22bb5c29b48f51546d74a')
sha256sums_x86_64=('61eba9999aa18a73fac28005dc7c812a9875fd6aba65aaa0f91d1031a974023f')
sha256sums_armv7h=('dae85dd901720347b964a029b7b00585f099fea74025d0d9f2690ae893d918b8')


package() {
    cd "${srcdir}"
    # binary
    install -Dm755 M-AIR-Edit -t "${pkgdir}"/usr/bin
    ln -sf M-AIR-Edit "${pkgdir}"/usr/bin/m-air-edit
    # .desktop file
    install -Dm644 m-air-edit.desktop -t "${pkgdir}"/usr/share/applications
    # icon
    install -Dm644 m-air-edit.png -t "${pkgdir}"/usr/share/icons
    # Release notes
    install -Dm644 *Release* -t "${pkgdir}"/usr/share/doc/${pkgname}
    # EULA
    install -Dm644 EULA_2012-09-12.pdf "${pkgdir}"/usr/share/licenses/${pkgname}/license.pdf
}
