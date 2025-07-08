pkgname=nerdfonts-installer-bin
pkgver=2025.07.08.1
pkgrel=1
pkgdesc="Executable binary to install Nerd Fonts"
arch=('x86_64')
url="https://github.com/fam007e/nerd_fonts_installer"
license=('MIT')
depends=('curl' 'unzip' 'fontconfig' 'shc') 
source=("https://github.com/fam007e/nerd_fonts_installer/releases/download/v${pkgver}/nerdfonts-installer-${pkgver}.tar.gz")
sha256sums=('0779f0757eba0593d39b6d590564aea8d10ba95a1c26a300cc17a6b6f6179dc2')

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
