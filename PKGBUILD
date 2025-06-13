# Maintainer: DawnMagnet <dawnmagnet@example.com>
pkgname=brave-hook-wayland
pkgver=1.0.0
pkgrel=2
pkgdesc="Pacman hook to enable Wayland support for brave-bin"
arch=('any')
url="https://aur.archlinux.org/packages/brave-hook-wayland"
license=('GPL')
depends=('brave-bin')
install=brave-hook-wayland.install
source=('brave-wayland.hook' 'apply-brave-wayland.sh')
sha256sums=('586ce85607ad2febfc7b0cc75975a11974cd5e13405e2ce95516dffa4faf3111'
            '16b6c296ce5075f8ad971d94fb873fc6afe60e7cd7d17b4c6e23177c66fa8826')

package() {
    # Install the pacman hook
    install -Dm644 "${srcdir}/brave-wayland.hook" "${pkgdir}/usr/share/libalpm/hooks/brave-wayland.hook"

    # Install the hook script
    install -Dm755 "${srcdir}/apply-brave-wayland.sh" "${pkgdir}/usr/share/brave-hook-wayland/apply-brave-wayland.sh"
}
