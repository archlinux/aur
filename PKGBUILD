# Maintainer: Faisal Ahmed Moshiur <faisalmoshiur+nerdfonts@gmail.com>
pkgname=nerdfonts-installer-bin
pkgver=2024.09.30.1
pkgrel=1
pkgdesc="Executable binary to install Nerd Fonts"
arch=('x86_64')
url="https://github.com/fam007e/nerd_fonts_installer"
license=('MIT')
depends=('curl' 'unzip' 'fontconfig' 'shc') 
source=("https://github.com/fam007e/nerd_fonts_installer/releases/download/v${pkgver}/nerdfonts-installer-${pkgver}.tar.gz")
sha256sums=('2f64bc6f9e42cc310c9d13e1af4650b1eedf2e05a94c598895fe2500d482cf4a')

package() {
    # Create source directory for installation
    local srcdir="$srcdir/nerd_fonts_installer-${pkgver}"

    # Change to source directory
    cd "$srcdir"

    # Compile the script into a binary
    shc -f nerdfonts_installer.sh -o nerdfonts-installer

    # Install the generated binary to the appropriate directory
    install -Dm755 "nerdfonts-installer" "$pkgdir/usr/bin/nerdfonts-installer"
}
