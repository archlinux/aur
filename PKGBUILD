# Maintainer: Mohd Lee <faulty.lee+aur@gmail.com>
# Contributor: Ricardo Band <email@ricardo.band>
pkgname=storageexplorer
pkgver=0.9.5
pkgrel=1
pkgdesc="Microsoft Azure Storage Explorer (Preview) is a standalone app from Microsoft that allows you to easily work with Azure Storage data on Windows, macOS and Linux."
arch=(x86_64)
url="http://storageexplorer.com/"
license=('unknown')
depends=('gnome-keyring' 'libgnome-keyring')
provides=('storageexplorer')
changelog=
source=("StorageExplorer-linux-x64.tar.gz::https://go.microsoft.com/fwlink/?LinkId=722418"
        "storageexplorer.desktop")
sha256sums=('71de6000051ac549dc81372c4a8925ad3e87c50f9230b8803b6023500be45d55'
            '0cc2d608894c17d8b3e76f7dd98d73314447d4435a7378d944d4c6ea948d0bf4')

package() {
    install -dm 755 "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "Azure Storage Explorer EULA.rtf" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "blink_image_resources_200_percent.pak" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "content_resources_200_percent.pak" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "content_shell.pak" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "icudtl.dat" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "libffmpeg.so" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "libnode.so" "${pkgdir}/opt/StorageExplorer/"
    cp -r "locales" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "natives_blob.bin" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "pdf_viewer_resources.pak" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "README" "${pkgdir}/opt/StorageExplorer/"
    cp -r "resources" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "snapshot_blob.bin" "${pkgdir}/opt/StorageExplorer/"
    install -m 755 "StorageExplorer" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "ThirdPartyNotices.txt" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "ui_resources_200_percent.pak" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "views_resources_200_percent.pak" "${pkgdir}/opt/StorageExplorer/"

    install -dm 755 "${pkgdir}/usr/bin"
    ln -s "/opt/StorageExplorer/StorageExplorer" "${pkgdir}/usr/bin/StorageExplorer"

    install -dm 755 "${pkgdir}/usr/share/applications"
    install -m 644 "storageexplorer.desktop" "${pkgdir}/usr/share/applications/"
}

