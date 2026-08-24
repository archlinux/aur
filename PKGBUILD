# Maintainer: KUHTOXO https://aur.archlinux.org/account/kuhtoxo

pkgname=max-bin
pkgver=26.28.2.77301
pkgrel=1

pkgdesc="MAX messenger."
arch=("x86_64")
url='https://max.ru'
license=("custom:max")
categories=("network")

depends=(
         "ca-certificates"
         "glib2"
         "libxcb"
         "libxinerama"
         "libxcomposite"
         "libxss"
         "xcb-util-wm"
         "xcb-util-cursor"
         "xcb-util-keysym"
         "libxkbcommon"
         "libva"
         "libxaw"
         "libvdpau"
         "libnotify"
         "gsettings-desktop-schemas"
         "libxres"
         "libglvnd"
        )
optdepends=('gnome-keyring: Fixses startup in Gmome. Store passwords and encryption keys.' 'hicolor-icon-theme')
options=('!strip' '!debug')

_app_name="MAX"
_filename="${_app_name}-${pkgver}.rpm"

provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_x86_64=("https://download.max.ru/linux/rpm/el/9/${arch}/${_filename}")

sha256sums_x86_64=('40dd56a82c67785f5dbc410e6c053e6294af625f6a1f47fe28881358aa08b230')

package() {
    cp -a "${srcdir}/usr/"  "${pkgdir}/usr/"
    mkdir -p "${pkgdir}/usr/bin/"
    ln -sf "/usr/share/max/bin/max" "${pkgdir}/usr/bin/max"
}
