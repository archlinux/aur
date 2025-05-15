# Maintainer: bash <m2588953@outlook.com>

# only linux-lts kernel can be built successfully,other kernel will be built failure because of missing linux/blk-mq-pci.h

pkgname=nvidia-fs-dkms
_pkgname=nvidia-fs
pkgver=2.25.7
pkgrel=1
pkgdesc="GPUDirect Storage kernel driver to read/write data from supported storage using cufile APIs"
arch=('x86_64')
url="https://docs.nvidia.com/gpudirect-storage"
license=('GPL2')
depends=('dkms')
source=("https://github.com/NVIDIA/gds-nvidia-fs/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('8eb745acf1a57e04b3e5deb35a91686f')



package() {
    cd gds-${_pkgname}-${pkgver}
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"


    mkdir -p "${pkgdir}"/usr/src/${_pkgname}-${pkgver}

    cp -r src/* "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/

    touch "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"

}
