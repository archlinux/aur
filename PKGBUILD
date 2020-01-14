pkgname='plasma-wallpaper-asciiquarium-git'
pkgver=r33.4d6e48a
pkgrel=1
pkgdesc='Plasma Wallpaper Neon Particles from Ivan Safonov'
arch=('any')
url='https://code.launchpad.net/~ivan-safonov/+junk/plasma-wallpaper-neon-particles'
license=('GPL')
depends=('plasma-workspace')
makedepends=('cmake' 'extra-cmake-modules' 'bzr')
provides=("${pkgname}")
source=("git+https://anongit.kde.org/scratch/mpyne/plasma_wallpaper_asciiquarium.git")
md5sums=('SKIP')

pkgver() {
  cd "plasma_wallpaper_asciiquarium"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/plasma_wallpaper_asciiquarium"
    cmake -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$srcdir/plasma_wallpaper_asciiquarium"
    make DESTDIR="$pkgdir/" install
}
