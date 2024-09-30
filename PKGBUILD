pkgname=nerdfonts-installer-bin
pkgver=2024.09.30.1
pkgrel=5
pkgdesc="Executable binary to install Nerd Fonts"
arch=('x86_64')
url="https://github.com/fam007e/nerd_fonts_installer"
license=('MIT')
depends=('curl' 'unzip' 'fontconfig' 'shc') 
source=("https://github.com/fam007e/nerd_fonts_installer/releases/download/v${pkgver}/nerdfonts-installer-${pkgver}.tar.gz")
sha256sums=('7c7a1e212a742d0dea7b352eedf5f96430d5d0819b118703684dc758dcad9bb1')

build() {
    # Change to the directory where the script is located
    cd "$srcdir/.."
    
    # Compile the script into a binary
    shc -f nerdfonts_installer.sh -o nerdfonts-installer
}

package() {
    # Change to the directory where the compiled binary is located
    cd "$srcdir/.."
    
    # Install the generated binary to the appropriate directory
    install -Dm755 "nerdfonts-installer" "$pkgdir/usr/bin/nerdfonts-installer"
}
