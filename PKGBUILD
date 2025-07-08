# Maintainer: NecRaul <necraul@kuroneko.dev>
# Contributor: Butter Cat <ButteredCats@protonmail.com>
# Contributor: Rhys Perry <rhysperry111@gmail.com>

pkgname=pywal-discord-git
pkgver=r98.8076fc4
pkgrel=1
pkgdesc="A script that dynamically generates discord theme based on the current wal colorscheme"
arch=("any")
url="https://github.com/NecRaul/pywal-discord"
license=("GPL3")
makedepends=("git")
conflicts=("pywal-discord")
provides=("pywal-discord")
source=("git+https://github.com/NecRaul/pywal-discord")
md5sums=("SKIP")

pkgver() {
    printf "r%s.%s" \
        "$(git -C "${srcdir}/pywal-discord" rev-list --count HEAD)" \
        "$(git -C "${srcdir}/pywal-discord" rev-parse --short HEAD)"
}

package() {
    install -Dm755 "${srcdir}/pywal-discord/pywal-discord" "${pkgdir}/usr/bin/pywal-discord"
    install -d "${pkgdir}/usr/share/pywal-discord"
    cp -r "${srcdir}/pywal-discord/config/." "${pkgdir}/usr/share/pywal-discord/"
}
