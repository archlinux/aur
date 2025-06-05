pkgname=nerdfonts-installer-bin
pkgver=v2025.06.05.1
pkgrel=2
pkgdesc="Executable binary to install Nerd Fonts"
arch=('x86_64')
url="https://github.com/fam007e/nerd_fonts_installer"
license=('MIT')
depends=('curl' 'unzip' 'fontconfig' 'shc') 
source=("https://github.com/fam007e/nerd_fonts_installer/releases/download/v${pkgver}/nerdfonts-installer-${pkgver}.tar.gz")
sha256sums=('ad3153d12589b61e6e465fd8e9cbca572be1f6d237d3896d8081b1b1f5485b72')

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
