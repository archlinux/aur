# Maintainer: DJ Griffin <thewisenoob@gmail.com>

pkgname=omp-git
pkgver=0.0.2.r2
pkgrel=2
pkgdesc='GTK3-based Music Player'
url='http://openmusicplayer.com/'
arch=(x86_64)
license=(GPL3)
depends=(gstreamer gtkmm3 libclastfm libconfig taglib)
makedepends=(boost git)
provides=('omp')
conflicts=('omp')
source=("$pkgname::git+https://github.com/TheWiseNoob/OpenMusicPlayer.git"
        "omp.desktop")
sha256sums=('SKIP'
            '6475694b67f1d76b7b4eff2c02cc360d73407937d726764c28ef49c3f70ea0fe')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  make
}

package() {
  cd "${pkgname}"
  install -Dm0755 omp "${pkgdir}/usr/bin/omp"
  install -Dm0644 Images/No_Cover.svg "${pkgdir}/usr/share/pixmaps/No_Cover.png"
  install -Dm0644 Images/OMP_Icon_16.png "${pkgdir}/usr/share/pixmaps/OMP_Icon_16.png"
  install -Dm0644 Images/OMP_Icon_32.png "${pkgdir}/usr/share/pixmaps/OMP_Icon_32.png"
  install -Dm0644 Images/OMP_Icon_48.png "${pkgdir}/usr/share/pixmaps/OMP_Icon_48.png"
  install -Dm0644 Images/OMP_Icon_64.png "${pkgdir}/usr/share/pixmaps/OMP_Icon_64.png"
  install -Dm0644 Images/OMP_Icon_128.png "${pkgdir}/usr/share/pixmaps/OMP_Icon_128.png"
  install -Dm0644 omp.desktop "${pkgdir}/usr/share/applications/omp.desktop"
}
