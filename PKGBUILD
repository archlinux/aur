# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Lev Lybin <aur@devtrue.net>

pkgname=synology-hyper-backup-explorer
pkgver=2.2.2.0141
_pkgver=2.2.2-0141
pkgrel=2
pkgdesc="A desktop tool for browsing, decrypting, and extracting different versions of backup data in Hyper Backup repositories"
arch=('x86_64')
url="https://www.synology.com/en-global/releaseNote/HyperBackupExplorer"
license=('unknown')
depends=('qt5-base' 'gtk2' 'openssl-1.0')
options=('!strip')
source=(https://global.download.synology.com/download/Tools/HyperBackupExplorer/${_pkgver}/Linux/x86_64/HyperBackupExplorer-${_pkgver}-linux.tar.bz2)
sha256sums=('d44ab409e8307d70ebe3a4b0a574666ce1543cd767a6784cf88cb0317bcae154')

prepare() {
    cd "${srcdir}"
}

package() {
    mkdir -p "${pkgdir}"/opt/Synology/HyperBackupExplorer
    install -Dm755 HyperBackupExplorer "${pkgdir}/opt/Synology/HyperBackupExplorer/HyperBackupExplorer"
    install -Dm755 QtWebEngineProcess "${pkgdir}/opt/Synology/HyperBackupExplorer/QtWebEngineProcess"
    install -Dm755 img_worker "${pkgdir}/opt/Synology/HyperBackupExplorer/img_worker"
    cp -r qt.conf help lib platforms plugins resources target translations "${pkgdir}/opt/Synology/HyperBackupExplorer"

    mkdir -p "${pkgdir}/usr/bin"
    ln -sf /opt/Synology/HyperBackupExplorer/HyperBackupExplorer "${pkgdir}/usr/bin/synology-hyper-backup-explorer"
}
