# Maintainer: Rafael Reggiani Manzo <rr.manzo#protonmail.com>

pkgname=blossoms-pokemon-go-manager
_pkgnum=0.1.1
pkgver=${_pkgnum}.beta
pkgrel=2
pkgdesc="BlossomsPokemonGoManager is a tool created for managing your game. It allows you to sort your Pokémon by several values, to rename, transfer, evolve or to power-up one or several of them. (NOTE: Read the PKGBUILD!)"
arch=('i686' 'x86_64')
url='https://github.com/Blossomforth/BlossomsPokemonGoManager'
license=('Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International')
depends=('java-runtime')
makedepends=('unzip')
source=("https://github.com/Blossomforth/BlossomsPokemonGoManager/releases/download/${_pkgnum}-Beta/BlossomsPogoManager.zip"
        'bpgm')
sha512sums=('39bf6fa9422b3d071d1606b0e008fe17a6bd0fb1f13e1abcae5b61774426ca5b4d2a91aaf7c07a920a58cb2af39316f31dee92c6c38fac296534f8633ff4deb2'
            'ea7b20d0d75141aa5c5b6a95eae134c274f8597f47d0b8da79e0eb563240a4d807d2ea08a95b7c80433e512d1f47e79b8f4bcee39e5c467a177aaaab78e9e5b2')

prepare() {
  unzip -u BlossomsPogoManager.zip
}

package() {
  install -D -m644 "${srcdir}/BlossomsPogoManager.jar" "${pkgdir}/usr/share/java/blossoms-pokemon-go-manager/BlossomsPogoManager.jar"
  install -D -m755 "${srcdir}/bpgm" "${pkgdir}/usr/bin/bpgm"
}
