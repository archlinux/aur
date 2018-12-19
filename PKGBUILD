# Maintainer: Mohd Lee <faulty.lee+aur@gmail.com>
# Contributor: Ricardo Band <email@ricardo.band>
pkgname=storageexplorer
pkgver=1.6.1
pkgrel=1
pkgdesc="Microsoft Azure Storage Explorer is a standalone app from Microsoft that allows you to easily work with Azure Storage data on Windows, macOS and Linux."
arch=(x86_64)
url="http://storageexplorer.com/"
license=('unknown')
depends=('gnome-keyring' 'libgnome-keyring' 'libsecret' 'gconf' 'gcc' 'dotnet-runtime')
provides=('storageexplorer')
changelog=
source=("StorageExplorer-linux-x64.tar.gz::https://go.microsoft.com/fwlink/?LinkId=722418"
        "storageexplorer.desktop")
sha256sums=('b1b846af6bee6a3fe36439302687e61a8654cb1d07e53a5202e5311b14b7703e'
            '0cc2d608894c17d8b3e76f7dd98d73314447d4435a7378d944d4c6ea948d0bf4')

package() {
    install -dm 755 "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "blink_image_resources_200_percent.pak" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "content_resources_200_percent.pak" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "content_shell.pak" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "icudtl.dat" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "libffmpeg.so" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "libnode.so" "${pkgdir}/opt/StorageExplorer/"
    cp -r "locales" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "natives_blob.bin" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "pdf_viewer_resources.pak" "${pkgdir}/opt/StorageExplorer/"
    cp -r "resources" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "snapshot_blob.bin" "${pkgdir}/opt/StorageExplorer/"
    install -m 755 "StorageExplorer" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "ui_resources_200_percent.pak" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "views_resources_200_percent.pak" "${pkgdir}/opt/StorageExplorer/"

    install -dm 755 "${pkgdir}/usr/bin"
    ln -s "/opt/StorageExplorer/StorageExplorer" "${pkgdir}/usr/bin/StorageExplorer"

    install -dm 755 "${pkgdir}/usr/share/applications"
    install -m 644 "storageexplorer.desktop" "${pkgdir}/usr/share/applications/"
}

