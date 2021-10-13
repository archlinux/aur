pkgname='plasma-wallpaper-asciiquarium-git'
pkgver=r33.4d6e48a
pkgrel=3
pkgdesc='Plasma Wallpaper Asciiquarium'
arch=('any')
url='https://cgit.kde.org/scratch/mpyne/plasma_wallpaper_asciiquarium.git/about/'
license=('GPL')
depends=('plasma-workspace')
makedepends=('cmake' 'extra-cmake-modules' 'git')
provides=("${pkgname}")
source=("git+https://invent.kde.org/mpyne/plasma_wallpaper_asciiquarium.git")
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
