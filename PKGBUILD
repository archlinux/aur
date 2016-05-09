# Maintainer: Phillip Schichtel <phillip.public@schich.tel>
pkgname=adapta-gtk-theme
_gtk3_version='3.21'
pkgver="${_gtk3_version}.1.118"
pkgrel=1
pkgdesc="An adaptive Gtk+ theme based on Material Design Guidelines."
arch=(any)
url="https://github.com/tista500/Adapta"
license=('GPL2')
depends=('gtk2>=2.24.29'
         'gtk3>=3.18'
         "gtk3<=${_gtk3_version}.99")
optdepends=('gnome-shell>=3.18: The GNOME Shell'
            'gnome-flashback>=3.18: The GNOME flashback shell'
            'budgie-desktop>=10.2.4: The Budgie desktop'
            'cinnamon>=2.8: The Cinnamon desktop'
            'xfdesktop>=4.12.2: The Xfce desktop'
            'paper-icon-theme-git: A fitting icon theme'
            'gnome-tweak-tool: A graphical tool to tweak gnome settings')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tista500/Adapta/archive/${pkgver}.tar.gz")
sha256sums=(c21864f2445f44820a596c8614641f7a8aea7492b3697a040e26c26bdc0ea6f4)

_theme_name=Adapta
_extracted_folder="${_theme_name}-$pkgver"

package() {
    default="${pkgdir}/usr/share/themes/${_theme_name}"
    nokto="${default}-Nokto"
    install -dm755 "$default"
    cp -dpr --no-preserve=ownership "${_extracted_folder}/." "$default"

    install -dm755 "$nokto"
    cp -dpr --no-preserve=ownership "${_extracted_folder}/." "$nokto"

    mv "${nokto}/index.theme"{-nokto,}
    mv "${nokto}/gtk-2.0/gtkrc"{-dark,}
}
