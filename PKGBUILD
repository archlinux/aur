# Maintainer: Phillip Schichtel <phillip.public@schich.tel>
pkgname=adapta-gtk-theme
_gtk3_version='3.20'
pkgver="${_gtk3_version}.3.99"
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
            'budgie-desktop>=10.2.4'
            'cinnamon>=2.8'
            'xfdesktop>=4.12.2'
            'paper-icon-theme-git: A fitting icon theme'
            'gnome-tweak-tool: A graphical tool to tweak gnome settings')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tista500/Adapta/archive/${pkgver}.tar.gz")
sha256sums=(3f7094308fe557adba6066fa577bd6a128f7baafaf6f6cdf3aaf76af6a03f1ae)

_theme_name=Adapta
_extracted_folder="${_theme_name}-$pkgver"

package() {
    target="${pkgdir}/usr/share/themes/${_theme_name}"
    install -dm755 "$target"
    cp -dpr --no-preserve=ownership "${_extracted_folder}/." "$target"
}
