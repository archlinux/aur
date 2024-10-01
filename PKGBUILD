# Maintainer: Emanuel Serpa <emanuelvserpa@gmail.com>

pkgname=kopia-ui-bin-wayland-hook
pkgver=1
pkgrel=1
pkgdesc="Pacman hook to change kopia-ui-bin to start with ozone-platform-hint=auto after install or upgrade."
arch=("any")
install=kopia-ui-bin-wayland-hook.install
license=("MIT")
depends=('kopia-ui-bin')
source=(kopia-ui-bin-wayland.hook kopia-ui-bin-wayland)
sha1sums=('038203b9c9da6bc8a3de4e266a3a58a1f2af3061'
          'fdbf52c61d926bb67cb47d9b5d80c8ab93eb86da')

package() {
    install -m755 -d "${pkgdir}/usr/share/libalpm/hooks"
    install -m644 "${srcdir}/kopia-ui-bin-wayland.hook" "${pkgdir}/usr/share/libalpm/hooks/kopia-ui-bin-wayland.hook"
    install -m755 -d "${pkgdir}/usr/share/libalpm/scripts"
    install -m755  "${srcdir}/kopia-ui-bin-wayland" "${pkgdir}/usr/share/libalpm/scripts/kopia-ui-bin-wayland" 
}
