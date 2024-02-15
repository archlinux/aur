# Maintainer: Emanuel Serpa <emanuelvserpa@gmail.com>

pkgname=vscodium-git-wayland-hook
pkgver=1
pkgrel=1
pkgdesc="Pacman hook to change vscodium-git to start with ozone-platform-hint=auto after install or upgrade."
arch=("any")
install=vscodium-git-wayland-hook.install
license=("MIT")
depends=('vscodium-git')
source=(vscodium-git-wayland.hook vscodium-git-wayland)
sha1sums=('fefd5c8357c8067951a18647044a862973f90493'
          'a974bd0c730ab33b285f1c594d7b7a86baec5430')

package() {
    install -m755 -d "${pkgdir}/usr/share/libalpm/hooks"
    install -m644 "${srcdir}/vscodium-git-wayland.hook" "${pkgdir}/usr/share/libalpm/hooks/vscodium-git-wayland.hook"
    install -m755 -d "${pkgdir}/usr/share/libalpm/scripts"
    install -m755  "${srcdir}/vscodium-git-wayland" "${pkgdir}/usr/share/libalpm/scripts/vscodium-git-wayland" 
}
