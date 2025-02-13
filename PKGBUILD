# Maintainer: Dhruva Sambrani <dhruvasambrani19[at]gmail[dot]com>

pkgname=bitwarden-bin-wayland-hook
pkgver=1
pkgrel=2
pkgdesc="Pacman hook to change bitwarden-bin to start with electron flags to start with wayland after install or upgrade."
arch=("any")
install=bitwarden-bin-wayland-hook.install
license=("MIT")
depends=('bitwarden-bin')
source=(bitwarden-bin-wayland.hook bitwarden-bin-wayland)
sha1sums=('0bbd615e3e5bdfcd199ea545de147c829ad493ee'
          'd241c5373a266ebb7ce537023cf8f6ae78aba471')

package() {
    install -m755 -d "${pkgdir}/usr/share/libalpm/hooks"
    install -m644 "${srcdir}/bitwarden-bin-wayland.hook" "${pkgdir}/usr/share/libalpm/hooks/bitwarden-bin-wayland.hook"
    install -m755 -d "${pkgdir}/usr/share/libalpm/scripts"
    install -m755  "${srcdir}/bitwarden-bin-wayland" "${pkgdir}/usr/share/libalpm/scripts/bitwarden-bin-wayland" 
}
