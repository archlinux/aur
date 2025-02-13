# Maintainer: Dhruva Sambrani <dhruvasambrani19[at]gmail[dot]com>

pkgname=bitwarden-bin-wayland-hook
pkgver=1
pkgrel=1
pkgdesc="Pacman hook to change bitwarden-bin to start with electron flags to start with wayland after install or upgrade."
arch=("any")
install=bitwarden-bin-wayland-hook.install
license=("MIT")
depends=('bitwarden-bin')
source=(bitwarden-bin-wayland.hook bitwarden-bin-wayland)
sha1sums=('1d16dd32583e56787a7cf63ff294402512caac32'
          'da5d9445d3a83a12e1bc3caf42f7a3b983eac28d')

package() {
    install -m755 -d "${pkgdir}/usr/share/libalpm/hooks"
    install -m644 "${srcdir}/bitwarden-bin-wayland.hook" "${pkgdir}/usr/share/libalpm/hooks/bitwarden-bin-wayland.hook"
    install -m755 -d "${pkgdir}/usr/share/libalpm/scripts"
    install -m755  "${srcdir}/bitwarden-bin-wayland" "${pkgdir}/usr/share/libalpm/scripts/bitwarden-bin-wayland" 
}
