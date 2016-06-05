# Maintainer: FadeMind <fademind@gmail.com>

pkgname=vlc-arc-dark-git
pkgver=20160605
pkgrel=1
pkgdesc='ARC Dark skin for VLC Media Player (git version)'
url='https://github.com/varlesh/VLC-Arc-Dark'
arch=('any')
license=('GPL')
depends=('vlc')
makedepends=('git' 'make')
conflicts=('vlc-arc-dark')
options=('!strip')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
    cd ${pkgname}
    make install DESTDIR="$pkgdir"
}
