# Maintainer: KUHTOXO https://aur.archlinux.org/account/kuhtoxo

pkgname=max-bin
pkgver=26.7.0.49753
pkgrel=2

pkgdesc="MAX messenger."
arch=("x86_64")
url='https://max.ru'
license=("custom:max")
categories=("network")

depends=("libxcb" "libxinerama" "libxcomposite" "xcb-util-wm" "libva" "libvdpau" "libnotify" "desktop-file-utils" "libxres")
optdepends=('gnome-keyring: Fixses startup in Gmome. Store passwords and encryption keys.' 'hicolor-icon-theme')
options=('!strip' '!debug')

_app_name="MAX"
_filename="${_app_name}-${pkgver}.rpm"

provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_x86_64=("https://download.max.ru/linux/rpm/el/9/${arch}/${_filename}")

sha256sums_x86_64=('75c22da51625d4eaba9259643c32bfb756008015159abd85817ca5b32cd27936')

package() {
    cp -a "${srcdir}/usr/"  "${pkgdir}/usr/"
    mkdir -p "${pkgdir}/usr/bin/"
    ln -sf "/usr/share/max/bin/max" "${pkgdir}/usr/bin/max"
}
