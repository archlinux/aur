# Maintainer: Marc Aldorasi <m101010a at gmail dot com>
pkgname=boot-mirror
pkgver=1.0
pkgrel=1
pkgdesc="Mirror /boot directory on kernel upgrades"
arch=('any')
url="https://wiki.archlinux.org/index.php/User:Allan/Pacman_Hooks"
license=('GPL')
depends=('rsync')
source=("boot-mirror.sh"
        "mirror-kernel.hook")
sha256sums=("b97d290f26268acbb925a1f699bb0f692c4a511d04d0898b88564196fdfeb7b7"
            "7b7646179a215721a3c69449e20fc108aa91e97398346761fdd95af2e75fda86")

package() {
	install -m755 -d "${pkgdir}/etc/pacman.d/hooks"
	install -m 644 "${srcdir}/mirror-kernel.hook" "${pkgdir}/etc/pacman.d/hooks/mirror-kernel.hook"
	install -m755 -d "${pkgdir}/usr/bin"
	install -m 755 "${srcdir}/boot-mirror.sh" "${pkgdir}/usr/bin/boot-mirror.sh"
}

