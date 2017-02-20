# Maintainer: Lev Lybin <aur@devtrue.net>

pkgname=synology-hyper-backup-explorer
pkgver=0073
_sver=2.0.2
pkgrel=1
pkgdesc="A desktop tool for browsing, decrypting, and extracting different versions of backup data in Hyper Backup repositories"
arch=('x86_64')
url="https://www.synology.com/en-global/releaseNote/HyperBackupExplorer"
license=('unknown')

source_x86_64=(https://global.download.synology.com/download/Tools/HyperBackupExplorer/${_sver}-${pkgver}/Linux/x86_64/HyperBackupExplorer-${_sver}-${pkgver}-linux.tar.bz2)
md5sums_x86_64=('eadcb11b5c9fdc36b3311b32d31e0d3f')

prepare() {
    cd "${srcdir}"
}

package() {
    mkdir -p "${pkgdir}"/opt/Synology/HyperBackupExplorer/{platforms,platformthemes,lib,help}
    install -Dm755 HyperBackupExplorer "${pkgdir}/opt/Synology/HyperBackupExplorer/HyperBackupExplorer"
    install -t "${pkgdir}/opt/Synology/HyperBackupExplorer/platforms" platforms/*.so
    install -t "${pkgdir}/opt/Synology/HyperBackupExplorer/platformthemes" platformthemes/*.so
    install -t "${pkgdir}/opt/Synology/HyperBackupExplorer/lib" lib/*.so.*
    cp -r help/* "${pkgdir}/opt/Synology/HyperBackupExplorer/help"

    mkdir -p "${pkgdir}/usr/bin"
    ln -sf /opt/Synology/HyperBackupExplorer/HyperBackupExplorer "${pkgdir}/usr/bin/synology-hyper-backup-explorer"
}
