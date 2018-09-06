# Maintainer: Ainola

pkgname=ttf-material-wifi-icons-git
pkgver=r15.03e41a0
pkgrel=1
arch=('any')
url='https://github.com/dcousens/material-wifi-icons'
pkgdesc='WiFi icons inspired by Material Icons'
license=('MIT')
source=('git://github.com/dcousens/material-wifi-icons.git')
sha256sums=('SKIP')

pkgver() {
    cd material-wifi-icons
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    # As upstream named the font with a hyphen in the name, remember to escape
    # the hyphen in your application. For example, with Polybar, use:
    # font-3 = material\-wifi:size=10

    install -Dm644 material-wifi-icons/material-wifi.ttf \
        -t "$pkgdir/usr/share/fonts/TTF/"

    install -Dm644 material-wifi-icons/LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 material-wifi-icons/README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
