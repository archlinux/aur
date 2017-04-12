# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=storageexplorer
pkgver=0.8.12
pkgrel=1
pkgdesc="Microsoft Azure Storage Explorer (Preview) is a standalone app from Microsoft that allows you to easily work with Azure Storage data on Windows, macOS and Linux."
arch=(x86_64)
url="http://storageexplorer.com/"
license=('unknown')
depends=('gnome-keyring')
provides=('storageexplorer')
changelog=
source=("StorageExplorer-linux-x64.tar.gz::https://go.microsoft.com/fwlink/?LinkId=722418"
        "storageexplorer.desktop")
sha256sums=('ada50a95e00f1b8626502ec59ae4b27bc77421613ff8aab1ae8f723d2023e4d8'
            'c11f45ad21c26007ba2f852e6a522e41e2433c527223b04d41648eb71fb7384f')

package() {
    #cd "$pkgname-$pkgver"

    install -dm 755 "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "Azure Storage Explorer EULA.rtf" "${pkgdir}/opt/StorageExplorer/"
    install -m 755 "StorageExplorer" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "content_shell.pak" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "libnode.so" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "Credits_43.0.2357.65.html" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "icudtl.dat" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "snapshot_blob.bin" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "README" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "ThirdPartyNotices.txt" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "libffmpeg.so" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "natives_blob.bin" "${pkgdir}/opt/StorageExplorer/"
    cp -r "resources" "${pkgdir}/opt/StorageExplorer/"
    cp -r "locales" "${pkgdir}/opt/StorageExplorer/"

    install -dm 755 "${pkgdir}/usr/bin"
    ln -s "/opt/StorageExplorer/StorageExplorer" "${pkgdir}/usr/bin/StorageExplorer"

    install -dm 755 "${pkgdir}/usr/share/applications"
    install -m 644 "storageexplorer.desktop" "${pkgdir}/usr/share/applications/"
}

