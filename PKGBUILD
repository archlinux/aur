# Maintainer: Phillip Schichtel <phillip.public@schich.tel>
pkgname=adapta-gtk-theme
_gtk3_version='3.20.2'
pkgver="${_gtk3_version}.118"
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
sha256sums=(7511d723af0e9e2f6dbf22571f5725dd4adf38586b0c52e06927f6f8b931db1f)

_theme_name=Adapta
_extracted_folder="${_theme_name}-$pkgver"

package() {
    target="${pkgdir}/usr/share/themes/${_theme_name}"
    install -dm755 "$target"
    cp -dpr --no-preserve=ownership "${_extracted_folder}/." -d "$target"
}
