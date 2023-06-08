# Maintainer: Rich Lees <git0 at bitservices.io>
# Contributor: Lev Lybin <aur@devtrue.net>

pkgname=synology-cloud-sync-decryption-tool
pkgver=027
pkgrel=1
pkgdesc="A desktop tool to decrypt data encrypted by Cloud Sync"
arch=('i686' 'x86_64')
url="https://www.synology.com/en-global/releaseNote/SynologyCloudSyncDecryptionTool"
license=('unknown')
depends=('qt5-base')

source_x86_64=(https://global.synologydownload.com/download/Utility/SynologyCloudSyncDecryptionTool/${pkgver}/Linux/x86_64/SynologyCloudSyncDecryptionTool-${pkgver}_x64.tar.gz)
source_i686=(https://global.synologydownload.com/download/Utility/SynologyCloudSyncDecryptionTool/${pkgver}/Linux/i686/SynologyCloudSyncDecryptionTool-${pkgver}.tar.gz)
md5sums_x86_64=('f319f9c6cd89783d0060234adb324263')
md5sums_i686=('afdd654d39940d4b2cd256ef1dab95a5')

prepare() {
    cd "${srcdir}"
}

package() {
    mkdir -p "${pkgdir}/opt/Synology/CloudSyncDecryptionTool/platforms"
    install -Dm755 SynologyCloudSyncDecryptionTool "${pkgdir}/opt/Synology/CloudSyncDecryptionTool/SynologyCloudSyncDecryptionTool"

    mkdir -p "${pkgdir}/usr/bin"
    ln -sf /opt/Synology/CloudSyncDecryptionTool/SynologyCloudSyncDecryptionTool "${pkgdir}/usr/bin/synology-cloud-sync-decryption-tool"
}
