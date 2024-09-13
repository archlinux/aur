# Maintainer: Alan Sartorio

pkgname=orchis-theme
pkgdesc="A Material Design theme for GNOME/GTK based desktop environments."
pkgver=2024_09_02
pkgrel=1
url="https://github.com/vinceliuice/${pkgname}"
arch=('any')
license=('GPL3')
optdepends=('gtk-engine-murrine: for gtk2 themes'
            'gnome-themes-extra: for gtk2 themes'
            'tela-circle-icon-theme: recommended icon theme' # from /usr/share/themes/Orchis/index.theme
            'vimix-cursors: recommended cursors theme')
conflicts=("${pkgname}")
replaces=("${pkgname}-bin")
options=(!strip !debug)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver//_/-}.tar.gz")
sha256sums=('ecba0e0db854e74a2cc31e92b5f7218832229b74bd8d0ebdbd6ebb6dafe557fa')

package() {
    cd "Orchis-theme-${pkgver//_/-}"

    install -dm755 "$pkgdir/usr/share/themes"
    ./install.sh --dest "$pkgdir/usr/share/themes"
}
