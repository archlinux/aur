pkgname=yavta-git
pkgver=r122.405e530
pkgrel=1
pkgdesc='Yet Another V4L2 Test Application'
arch=('x86_64' 'i686' 'aarch64')
url='https://git.ideasonboard.org/yavta.git'
makedepends=('git')
license=('GPL2')
source=('git://git.ideasonboard.org/yavta.git')
md5sums=('SKIP')

pkgver() {
  cd yavta
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/yavta"
    make
}

package() {
    cd "$srcdir/yavta"
    install -D "${srcdir}/yavta/yavta" "${pkgdir}/usr/bin/yavta"
}
