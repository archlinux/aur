# Maintainer: Phillip Schichtel <phillip.public@schich.tel>
pkgname=adapta-gtk-theme
_gtk3_version='3.20'
pkgver="${_gtk3_version}.3.80"
pkgrel=2
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
            'paper-icon-theme-git: A fitting icon theme'
            'gnome-tweak-tool: A graphical tool to tweak gnome settings')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tista500/Adapta/archive/${pkgver}.tar.gz")
sha256sums=(6ba7ab22b49cc7705491c893dc2a669b8c4ba6dde257dab8d50e49fcc1249dbd)

_theme_name=Adapta
_extracted_folder="${_theme_name}-$pkgver"

package() {
    target="${pkgdir}/usr/share/themes/${_theme_name}"
    install -dm755 "$target"
    cp -dpr --no-preserve=ownership "${_extracted_folder}/." "$target"
}
