# Contributor: Daniel Miranda (dmiranda)
# Contributor: Fabio ‘Lolix’ Loli <lolix at disroot dot org>
# Contributor: Jonathon <jonathonf>
# Maintainer: Gustavo Costa (gusbemacbe)

pkgname=suru-plus-aspromauros-git
pkgver=2.1
pkgrel=1
pkgdesc="Suru++ Asprómauros – A full monochromatic icons set for users of dark environments"
arch=('any')
url="https://github.com/gusbemacbe/${pkgname/-git/}"
license=('GPL3')
changelog=CHANGELOG
makedepends=('git')
conflicts=(${pkgname/-git/})
provides=(${pkgname/-git/})
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() 
{
    git -C ${pkgname/-git/} describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

package() 
{
    make -C ${pkgname/-git/} DESTDIR="$pkgdir/" install
}
