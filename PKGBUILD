# Maintainer: Alan Sartorio

pkgname=orchis-theme
pkgdesc="A Material Design theme for GNOME/GTK based desktop environments."
pkgver=2024_05_30
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
sha256sums=('24eedf42d79b36d2f405a167db47d2a8d50ccb34a27767ae80a8dff470d0a482')

package() {
    cd "Orchis-theme-${pkgver//_/-}"

    install -dm755 "$pkgdir/usr/share/themes"
    ./install.sh --dest "$pkgdir/usr/share/themes"
}
