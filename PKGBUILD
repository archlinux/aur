# Maintainer: Gustavo Costa <gusbemacbe@gmail.com>

pkgname=yaru-plus-git
pkgver=3.0
pkgrel=3
pkgdesc="Yaru++ – Elegant and modern third-party icons theme, based on Canonical’s Yaru "
arch=('any')
url="https://github.com/Bonandry/${pkgname/-git/}"
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
