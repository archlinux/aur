# Maintainer: Jimmy Källhagen
# Mail: TheEnchantedPotato@proton.me

#   ##=================================================================##
#    )                                                                  )
#   (     If you would like to participate in the Nordix project.      (
#    )                    you are most welcome                          )
#   (                               *                                  (
#    )                        Nordix project                            )
#   (           https://github.com/jimmykallhagen/Nordix               (
#    )          https://github.com/jimmykallhagen/Yggdrasil             )
#   (           https://github.com/jimmykallhagen/*                    (
#   (           https://gitlab.com/TheEnchantedPotato/nordix           (
#    )                                                                  )
#   ##=================================================================##

pkgname=pacman-bulk-rns
pkgver=1.0
pkgrel=1
pkgdesc="Nordix pacman wrapper - Search and bulk remove package"
arch=('any')
url="https://github.com/jimmykallhagen/pacman-bulk-Rns.git"
license=('GPL3')
depends=('bash' 'git' 'base-devel')
conflicts=('Microsoft-Windows')
provides=('pacman-bulk-Rns')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_pkgsrc="$pkgname"
source=("$_pkgsrc::git+$url")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$_pkgsrc"
    install -Dm755 pacman-bulk-rns "$pkgdir/usr/bin/pacman-bulk-Rns"
}

