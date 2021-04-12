# Maintainer: Gustavo Costa <gusbemacbe@gmail.com>

pkgname=adwaita-plus-git
pkgver=6.1.r4.g22a8a79f
pkgrel=1
pkgdesc="A third-party icons theme, based on new GNOME Project's Adwaita"
arch=('any')
url="https://github.com/Bonandry/${pkgname/-git/}"
license=('GPL3')
changelog=CHANGELOG.sh
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
