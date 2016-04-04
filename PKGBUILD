# Maintainer: Phillip Schichtel <phillip.public@schich.tel>
pkgname=adapta-gtk-theme
_gtk3_version='3.20.2'
pkgver="${_gtk3_version}.45"
pkgrel=1
pkgdesc="An adaptive Gtk+ theme based on Material Design Guidelines."
arch=(any)
url="https://github.com/tista500/Adapta"
license=('GPL2')
install="${pkgname}.install"
depends=('gtk2' 'gtk3>=3.18', "gtk3<=${_gtk3_version}")
optdepends=('paper-icon-theme-git: A fitting icon theme'
            'gnome-tweak-tool: A graphical tool to tweak gnome settings')
source=("https://github.com/tista500/Adapta/archive/${pkgver}.tar.gz")
sha256sums=(729d8a16af57fcafb76a2ed25ab6862e5199722a4c2b57eca04031e7a01591b1)

_theme_name=Adapta
_extracted_folder="${_theme_name}-$pkgver"

package() {
    target="${pkgdir}/usr/share/themes/${_theme_name}"
    install -dm755 "$target"
    cp -dpr --no-preserve=ownership "${_extracted_folder}/." -d "$target"
}
