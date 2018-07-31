# Maintainer: lks <lukas dot graetz at web dot de>
pkgname=cbootimage
pkgver=1.8
pkgrel=1
pkgdesc="Tools to dump and generate boot config table on Tegra devices"
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
url="http://http.download.nvidia.com/tegra-public-appnotes/bct-overview.html"
makedepends=('automake' 'autoconf')
source=('cbootimage.tar')
source=("https://github.com/NVIDIA/cbootimage/archive/v${pkgver}.tar.gz")
sha256sums=('46cce01f07df977668de9e1d49884d8ed539169994215606a9719d17b9db8804')


build() {
    cd "${pkgname}-${pkgver}"
    autoreconf --install --symlink
    ./configure --prefix=/usr
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
