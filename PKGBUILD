# Maintainer: lks <lukas dot graetz at web dot de>
pkgname=cbootimage
pkgver=1.6
pkgrel=2
pkgdesc="Tools to dump and generate boot config table on Tegra devices"
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
url="http://http.download.nvidia.com/tegra-public-appnotes/bct-overview.html"
makedepends=('automake' 'autoconf')
source=('cbootimage.tar')
source=("https://github.com/NVIDIA/cbootimage/archive/v${pkgver}.tar.gz")
sha256sums=('a15739c9e2ca4f582de56c4c795c057d7b322224edd65228bdd725dfdd3aa78c')


build() {
    cd "${pkgname}-${pkgver}"
    autoreconf --install --symlink
    ./configure --prefix=/usr
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
