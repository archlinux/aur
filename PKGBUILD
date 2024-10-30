pkgname=nerdfonts-installer-bin
pkgver=2024.10.30.1
pkgrel=1
pkgdesc="Executable binary to install Nerd Fonts"
arch=('x86_64')
url="https://github.com/fam007e/nerd_fonts_installer"
license=('MIT')
depends=('curl' 'unzip' 'fontconfig' 'shc') 
source=("https://github.com/fam007e/nerd_fonts_installer/releases/download/v${pkgver}/nerdfonts-installer-${pkgver}.tar.gz")
sha256sums=('f7b0d2a4b04fe0de1d36819dfc7a4af6804f26c143ea0dc1510d7a3ac5daeafd')

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
