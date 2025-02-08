# Maintainer: Sid Pranjale <sidpranjale127@protonmail.com>
pkgname=auto-gpufreq-git
pkgver=r8.8e108b9
pkgrel=1
pkgdesc="Tiny daemon for conservative frequency scaling on GPUs."
arch=("x86_64")
url="https://gitlab.com/Sid127/auto-gpufreq"
licelse=("WTFPL")
depends=(nvidia-utils)
makedepends=(make)
source=('git+https://gitlab.com/Sid127/auto-gpufreq.git')
sha256sums=('SKIP')

pkgver() {
    cd $srcdir/auto-gpufreq
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd auto-gpufreq
    make
}

package() {
    cd auto-gpufreq
    make DESTDIR="${pkgdir}" install INIT=systemd
}
