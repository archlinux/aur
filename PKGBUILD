# Maintainer: Magniquick
pkgname=hyprgrass-meta
pkgver=1.0
pkgrel=1
pkgdesc="Meta package to install dependencies and enable Hyprgrass for Hyprland"
arch=('any')
url="https://github.com/horriblename/hyprgrass"
license=('custom')
depends=('hyprland' 'glm')
makedepends=('meson' 'ninja')
provides=('hyprgrass-meta')
conflicts=('hyprgrass-meta')

package() {
    install -Dm644 /dev/null "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

post_install() {
    echo "Adding and enabling Hyprgrass..."
    hyprpm add https://github.com/horriblename/hyprgrass
    hyprpm enable hyprgrass
}

post_upgrade() {
    echo "Updating Hyprgrass..."
    hyprpm update hyprgrass
}

post_remove() {
    echo "Disabling and removing Hyprgrass..."
    hyprpm disable hyprgrass
    hyprpm remove hyprgrass
}
