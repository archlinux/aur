# Maintainer : Hugo Berthet-Rambaud <hugoberthetrambaud@outlook.com>

pkgname=spacelaunch
pkgver=1.2.7
pkgrel=1
pkgdesc="Help keep track of upcoming rocket launches"
arch=('x86_64')
url="https://gitlab.com/elescoute/spacelaunch"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' )
makedepends=('vala' 'meson' 'git')
#provides=('')
#conflicts=('')
#replaces=('')
source=("git+${url}#tag=${pkgver}")
sha256sums=('7499c6f7aea709a8683ab9208493f9d022d767041519e530820013b3948ac1aa')


build() {
    arch-meson $pkgname build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
