# Maintainer: Rafael Reggiani Manzo <rr.manzo#protonmail.com>

pkgname=blossoms-pokemon-go-manager
pkgver=0.1.7
pkgrel=1
pkgdesc="BlossomsPokemonGoManager is a tool created for managing your game. It allows you to sort your Pokémon by several values, to rename, transfer, evolve or to power-up one or several of them. (NOTE: Read the PKGBUILD!)"
arch=('i686' 'x86_64')
url='https://github.com/Wolfsblvt/BlossomsPokemonGoManager'
license=('Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International')
depends=('jre')
makedepends=('unzip')
install=bpgm.install
source=("https://github.com/Wolfsblvt/BlossomsPokemonGoManager/releases/download/v${pkgver}/BPGM_v${pkgver}.zip"
        'bpgm')
sha512sums=('ssh://aur@aur.archlinux.org/blossoms-pokemon-go-manager.git'
            '5b72b358a1f0c3e8dde715e48231b4c0eef0d647370effbf95d723e254a9c999971424e02ae444ad019c28c3ccbfba0d5ecf27752cfcea80b3ed793731ac0da1')

prepare() {
  unzip -u BPGM_v${pkgver}.zip
}

package() {
  install -D -m644 "${srcdir}/BPGM_v${pkgver}/BlossomsPogoManager.jar" "${pkgdir}/usr/share/java/blossoms-pokemon-go-manager/BlossomsPogoManager.jar"
  install -D -m755 "${srcdir}/bpgm" "${pkgdir}/usr/bin/bpgm"
}
