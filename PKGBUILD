# Maintainer: lks <lukas dot graetz at web dot de>
pkgname=cbootimage
pkgver=1.7
pkgrel=1
pkgdesc="Tools to dump and generate boot config table on Tegra devices"
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
url="http://http.download.nvidia.com/tegra-public-appnotes/bct-overview.html"
makedepends=('automake' 'autoconf')
source=('cbootimage.tar')
source=("https://github.com/NVIDIA/cbootimage/archive/v${pkgver}.tar.gz")
sha256sums=('373c108d7b6778c62a33e59ad0cd5ea9ebb379319a0c8b4cf469eaa8bec5521b')


build() {
    cd "${pkgname}-${pkgver}"
    autoreconf --install --symlink
    ./configure --prefix=/usr
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
