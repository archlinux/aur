# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=glog-squash-git
pkgver=1.1bfd52e
pkgrel=1
pkgdesc='Simple LD_PRELOAD shim to shut up GTK/Glib applications'
arch=('x86_64' 'i686')
url='https://github.com/sandsmark/glog-squash'
license=('GPL3')
depends=("genieutils-git>=709" 'sfml')
makedepends=('git' 'miniaudio-git>=1865')
conflicts=(glog-squash)
provides=(glog-squash)
optdepends=('ageofconquerors-trial-data: Game data files')
source=('git+https://github.com/sandsmark/glog-squash.git')
md5sums=('SKIP')

pkgver() {
    cd glog-squash
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd glog-squash
    make
}


package() {
    cd glog-squash
    install -D -m755 glog-squash.so -t "${pkgdir}/usr/lib/glog-squash/"
    install -D -m755 glog-squash.sh -t "${pkgdir}/etc/profile.d/"
}
