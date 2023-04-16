# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=stig-viewer-bin
pkgver=2.17
pkgrel=1
pkgdesc="Graphical user interface for XCCDF STIG files"
arch=('x86_64')
url="https://public.cyber.mil/stigs/stig-viewing-tools/"
license=('custom')
provides=("stig-viewer=${pkgver}")
conflicts=('stig-viewer')
source=("https://web.archive.org/web/20230416002444/https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_STIGViewer_2-17_Linux.zip"
        "https://upload.wikimedia.org/wikipedia/commons/0/05/US-DefenseInformationSystemsAgency-Seal.svg"
        "local://LICENSE"
        "local://stig-viewer.desktop")
sha256sums=('06b350cb758e9177140cf92a5ad95f2e6bc2c658fede46feff6a9701e9d185a6'
            'a1cdc9c6390b0af407c909bc9f02f2ed500103bac51ed6ce23ddbebf3fd7b9d8'
            'SKIP'
            'SKIP')

package() {
	mkdir -p "$pkgdir/opt/stig-viewer"
	cp -r bin conf legal lib release STIGViewer SWIDTAG "$pkgdir/opt/stig-viewer"
	mkdir -p "$pkgdir/usr/share/licenses/stig-viewer"
	cp -rL LICENSE legal/* "$pkgdir/usr/share/licenses/stig-viewer"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/apps"
	cp US-DefenseInformationSystemsAgency-Seal.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/stig-viewer.svg"
	mkdir -p "$pkgdir/usr/share/applications"
	cp stig-viewer.desktop "$pkgdir/usr/share/applications"
}
