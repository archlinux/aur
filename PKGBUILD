# Maintainer: Takase <takase1121 at proton dot me>

pkgname=discord-canary-with-flags
pkgver=1
pkgrel=1
pkgdesc="Pacman hook to change discord-canary to read flags from discord-canary.conf after install or upgrade."
arch=("any")
install=discord-canary-flags.install
license=("MIT")
depends=('discord-canary')
source=(discord-canary-flags.hook discord-canary-flags)
sha1sums=('359b081d5fd82e350892de81ae18d0c2e7de82cb'
          '7f5fb44804ca3b52622b958e9580b469d7b8e0dc')

package() {
    install -m755 -d "${pkgdir}/usr/share/libalpm/hooks"
    install -m644 "${srcdir}/discord-canary-flags.hook" "${pkgdir}/usr/share/libalpm/hooks/discord-canary-flags.hook"
    install -m755 -d "${pkgdir}/usr/share/libalpm/scripts"
    install -m755  "${srcdir}/discord-canary-flags" "${pkgdir}/usr/share/libalpm/scripts/discord-canary-flags" 
}
