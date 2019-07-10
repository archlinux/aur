# Maintainer: Lev Lybin <aur@devtrue.net>

pkgname=synology-cloud-sync-decryption-tool
pkgver=016
pkgrel=1
pkgdesc="A desktop tool to decrypt data encrypted by Cloud Sync"
arch=('i686' 'x86_64')
url="https://www.synology.com/en-global/releaseNote/SynologyCloudSyncDecryptionTool"
license=('unknown')
depends=('qt5-base')

source_x86_64=(https://global.download.synology.com/download/Tools/SynologyCloudSyncDecryptionTool/${pkgver}/Linux/x86_64/SynologyCloudSyncDecryptionTool-${pkgver}_x64.tar.gz)
source_i686=(https://global.download.synology.com/download/Tools/SynologyCloudSyncDecryptionTool/${pkgver}/Linux/i686/SynologyCloudSyncDecryptionTool-${pkgver}.tar.gz)
md5sums_x86_64=('608b1adbea3069a18d8830edbf9706e5')
md5sums_i686=('c87bda656d560f6d33ed8c825bf682e4')

prepare() {
    cd "${srcdir}"
}

package() {
    mkdir -p "${pkgdir}/opt/Synology/CloudSyncDecryptionTool/platforms"
    install -Dm755 SynologyCloudSyncDecryptionTool "${pkgdir}/opt/Synology/CloudSyncDecryptionTool/SynologyCloudSyncDecryptionTool"
    install -t "${pkgdir}/opt/Synology/CloudSyncDecryptionTool" *.so.*
    install -t "${pkgdir}/opt/Synology/CloudSyncDecryptionTool/platforms" platforms/*.so

    mkdir -p "${pkgdir}/usr/bin"
    ln -sf /opt/Synology/CloudSyncDecryptionTool/SynologyCloudSyncDecryptionTool "${pkgdir}/usr/bin/synology-cloud-sync-decryption-tool"
}


