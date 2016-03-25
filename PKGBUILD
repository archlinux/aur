# Maintainer: Lev Lybin <aur@devtrue.net>

pkgname=synology-cloud-sync-decryption-tool
pkgver=009
pkgrel=2
pkgdesc="A desktop tool to decrypt data encrypted by Cloud Sync"
arch=('i686' 'x86_64')
url="http://www.synology.com"
license=('unknown')

source_x86_64=(http://global.download.synology.com/download/Tools/SynologyCloudSyncDecryptionTool/${pkgver}/Linux/x86_64/SynologyCloudSyncDecryptionTool-${pkgver}_x64.tar.gz)
md5sums_i686=('abcea77e81631b36299365c863596aad')
md5sums_x86_64=('89400e01e23b1bd5b19dd70ef8f7b34e')
source_i686=(http://global.download.synology.com/download/Tools/SynologyCloudSyncDecryptionTool/${pkgver}/Linux/i686/SynologyCloudSyncDecryptionTool-${pkgver}.tar.gz)

prepare() {
    cd "${srcdir}"
}

package() {
    mkdir -p "${pkgdir}/opt/Synology/CloudSyncDecryptionTool/platforms"
    install -Dm755 SynologyCloudSyncDecryptionTool "${pkgdir}/opt/Synology/CloudSyncDecryptionTool"
    install -t "${pkgdir}/opt/Synology/CloudSyncDecryptionTool" *.so.*
    install -t "${pkgdir}/opt/Synology/CloudSyncDecryptionTool/platforms" platforms/*.so

    mkdir -p "${pkgdir}/usr/bin"
    ln -sf SynologyCloudSyncDecryptionTool "${pkgdir}/usr/bin/synology-cloud-sync-decryption-tool"
}
