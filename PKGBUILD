# Maintainer: Alan Sartorio

pkgname=orchis-theme
pkgdesc="A Material Design theme for GNOME/GTK based desktop environments."
pkgver=2024_04_18
pkgrel=2
url="https://github.com/vinceliuice/${pkgname}"
arch=('any')
license=('GPL3')
optdepends=('gtk-engine-murrine: for gtk2 themes'
            'gnome-themes-extra: for gtk2 themes'
            'tela-circle-icon-theme: recommended icon theme' # from /usr/share/themes/Orchis/index.theme
            'vimix-cursors: recommended cursors theme')
conflicts=("${pkgname}")
replaces=("${pkgname}-bin")
options=(!strip)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver//_/-}.tar.gz")
sha256sums=('b84c8b824c9d17c13ec74954a2479a7ca301effb506718ec09849f8ae8978818')

package() {
    cd "Orchis-theme-${pkgver//_/-}"

    install -dm755 "$pkgdir/usr/share/themes"
    ./install.sh --dest "$pkgdir/usr/share/themes"
}
