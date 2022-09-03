# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=stig-viewer
pkgver=2.16
pkgrel=1
pkgdesc="Graphical user interface for XCCDF STIG files"
arch=('x86_64')
url="https://public.cyber.mil/stigs/stig-viewing-tools/"
license=('custom')
source=("https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_STIGViewer_2-16_Linux.zip"
        "https://upload.wikimedia.org/wikipedia/commons/0/05/US-DefenseInformationSystemsAgency-Seal.svg"
        "local://LICENSE"
        "local://stig-viewer.desktop")
sha256sums=('654d37251bcbaff4bef353f7e835cf01a5df1a13dae3440026e7af414375d3e6'
            'a1cdc9c6390b0af407c909bc9f02f2ed500103bac51ed6ce23ddbebf3fd7b9d8'
            'SKIP'
            'SKIP')

package() {
	mkdir -p "$pkgdir/opt/stig-viewer"
	cp -r bin conf legal lib release STIGViewer SWIDTAG "$pkgdir/opt/stig-viewer"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	cp -rL LICENSE legal/* "$pkgdir/usr/share/licenses/$pkgname"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/apps"
	cp US-DefenseInformationSystemsAgency-Seal.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/stig-viewer.svg"
	mkdir -p "$pkgdir/usr/share/applications"
	cp stig-viewer.desktop "$pkgdir/usr/share/applications"
}
