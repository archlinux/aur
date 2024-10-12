# Maintainer: Your Name <your.email@example.com>
pkgname="carch"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="A script to automate Arch Linux setup"
arch=('x86_64')
url="https://harilvfs.github.io/carch/"
license=('MIT')
depends=('bash')  
source=()
sha256sums=()

build() {
    echo "Downloading setup.sh..."
    curl -L -o setup.sh "https://chalisehari.com.np/carch" || {
        echo "Failed to download setup.sh"
        exit 1
    }

    chmod +x setup.sh

    ./setup.sh
}

package() {
    install -Dm755 setup.sh "$pkgdir/usr/bin/carch-setup"
}

