# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=storageexplorer
pkgver=0.8.8
pkgrel=1
pkgdesc="Microsoft Azure Storage Explorer (Preview) is a standalone app from Microsoft that allows you to easily work with Azure Storage data on Windows, macOS and Linux."
arch=(x86_64)
url="http://storageexplorer.com/"
license=('unknown')
depends=()
provides=('storageexplorer')
changelog=
source=("StorageExplorer-linux-x64.tar.gz::https://go.microsoft.com/fwlink/?LinkId=722418"
        "storageexplorer.desktop")
sha256sums=('84ad34d711567cfa69e71eb6fb55bf9587f6055bc6940dc51cdcab30f1268fc9'
            '67e74fc6752c2b88ed74310d04f074fc75ed0035a7c3db39da35877b12b12a58')

package() {
	#cd "$pkgname-$pkgver"
	install -dm 755 "${pkgdir}/opt/StorageExplorer/"
    install -m 755 "StorageExplorer" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "version" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "snapshot_blob.bin" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "natives_blob.bin" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "libnode.so" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "libffmpeg.so" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "icudtl.dat" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "content_shell.pak" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "ThirdPartyNotices.txt" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "README" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "LICENSES.chromium.html" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "LICENSE" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "Credits_43.0.2357.65.html" "${pkgdir}/opt/StorageExplorer/"
    install -m 644 "Azure Storage Explorer EULA.rtf" "${pkgdir}/opt/StorageExplorer/"
    cp -r "locales" "${pkgdir}/opt/StorageExplorer/"
    cp -r "resources" "${pkgdir}/opt/StorageExplorer/"

	install -dm 755 "${pkgdir}/usr/bin"
    ln -s "/opt/StorageExplorer/StorageExplorer" "${pkgdir}/usr/bin/StorageExplorer"

    install -dm 755 "${pkgdir}/usr/share/applications"
    install -m 644 "storageexplorer.desktop" "${pkgdir}/usr/share/applications/"
}

