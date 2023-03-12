# Maintainer: Mohd Lee <faulty.lee+aur@gmail.com>
# Contributor: Ricardo Band <email@ricardo.band>
pkgname=storageexplorer
pkgver=1.28.1
pkgrel=1
pkgdesc="Microsoft Azure Storage Explorer is a standalone app from Microsoft that allows you to easily work with Azure Storage data on Windows, macOS and Linux."
arch=(x86_64)
url="https://github.com/microsoft/AzureStorageExplorer/releases"
license=('unknown')
depends=('glibc' 'dotnet-runtime-6.0')
provides=('storageexplorer')
changelog=
source=("Linux.StorageExplorer-x64-v$pkgver.tar.gz::https://github.com/microsoft/AzureStorageExplorer/releases/download/v$pkgver/StorageExplorer-linux-x64.tar.gz"
        "storageexplorer.desktop")
sha256sums=('eff1bcd8fba075bc39ed6f58e5ca314473a0a94ae3a4e3384f21f9a39bfd1859'
            '4d204461d8b4355723d8d461ca763676036aed9deff0eff1129176afcb7ff1ce')

package() {
    install -dm 755 "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "chrome_100_percent.pak" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "chrome_200_percent.pak" "${pkgdir}/opt/StorageExplorer/"
    install -m 755 "chrome_crashpad_handler" "${pkgdir}/opt/StorageExplorer/"
    install -m 755 "chrome-sandbox" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "icudtl.dat" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "libEGL.so" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "libffmpeg.so" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "libGLESv2.so" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "libvk_swiftshader.so" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "libvulkan.so.1" "${pkgdir}/opt/StorageExplorer/"
    cp -r "locales" "${pkgdir}/opt/StorageExplorer/"
    cp -r "resources" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "resources.pak" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "snapshot_blob.bin" "${pkgdir}/opt/StorageExplorer/"
    install -m 755 "StorageExplorer" "${pkgdir}/opt/StorageExplorer/"
    install -m 755 "StorageExplorerExe" "${pkgdir}/opt/StorageExplorer/"
    install -m 755 "StorageExplorerSnap" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "v8_context_snapshot.bin" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "vk_swiftshader_icd.json" "${pkgdir}/opt/StorageExplorer/"

    install -dm 755 "${pkgdir}/usr/bin"
    ln -s "/opt/StorageExplorer/StorageExplorer" "${pkgdir}/usr/bin/StorageExplorer"
    ln -s "/opt/StorageExplorer/StorageExplorerExe" "${pkgdir}/usr/bin/StorageExplorerExe"

    install -dm 755 "${pkgdir}/usr/share/applications"
    install -m 644 "storageexplorer.desktop" "${pkgdir}/usr/share/applications/"
}

