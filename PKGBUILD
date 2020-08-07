# Maintainer : Ashcon Mohseninia <ashcon50@gmail.com>

pkgname="razer-laptop-control-dkms-git"
pkgver=1.5
pkgrel=1
pkgdesc="Kernel module and daemon for razer laptop's for RGB, fan and power control"
arch=('i686' 'x86_64')
url="https://github.com/rnd-ash/razer-laptop-control"
license=("GPL2")
depends=('dkms')
makedepends=('git')
source=("git+https://github.com/rnd-ash/razer-laptop-control")
md5sums=("SKIP")
conflicts=("openrazer-meta" "openrazer-driver-dkms" "openrazer-meta-git" "openrazer-daemon-git")
install=driver.install

prepare() {
    cd $reponame
    echo "$pwd"
}

package() {
    cd "razer-laptop-control/driver"
    make DESTDIR="$pkgdir" driver_dkms
}
