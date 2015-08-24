# Maintainer: lks <lukas dot graetz at web dot de>
pkgname=cbootimage
pkgver=1.5
pkgrel=1
pkgdesc="Tools to dump and generate boot config table on Tegra devices"
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
url="http://http.download.nvidia.com/tegra-public-appnotes/bct-overview.html"
makedepends=('automake' 'autoconf')
source=('cbootimage.tar')
source=("https://github.com/NVIDIA/cbootimage/archive/v${pkgver}.tar.gz")
md5sums=('1a5f365391bbef5893fb9181523c95f3')


build() {
    cd "${pkgname}-${pkgver}"
    autoreconf --install --symlink
    ./configure --prefix=/usr
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
