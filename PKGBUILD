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
#   (           https://gitlab.com/TheEnchantedPotato/nordix           (
#    )                                                                  )
#   ##=================================================================##

pkgname=nordix-cli-zfs
pkgver=1.0
pkgrel=1
pkgdesc="Nordix CLI tools - for managing an ZFS system from  maintenance to troubleshooting" 
arch=('x86_64' 'aarch64')
url="https://github.com/jimmykallhagen/nordix-cli-zfs.git"
license=('GPL v3 or later')
depends=('bash' 'git' 'base-devel')
conflicts=('Microsoft-Windows')
provides=('nordix-cli-zfs')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_pkgsrc="nordix-cli-zfs"
source=("$_pkgsrc::git+$url")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$_pkgsrc"
    install -Dm755 nordix-cli-zfs "$pkgdir/usr/bin/nordix-cli-zfs"
}
