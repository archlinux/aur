pkgname=bgsync
pkgver=1.3.0
pkgrel=1
pkgdesc='Synchronization Tool'
arch=('any')
license=('None')
source=("https://bg-software.net/dls/bgsync_${pkgver}-${pkgrel}_Arch.zip")
depends=('mono')
makedepends=('unzip')

sha256sums=('7fbf9b6f1c21d02dfaef0aea16443f473b44904705360c0469b66ceef434726e')

package() {
	install -d "${pkgdir}/bin"
	install -d "${pkgdir}/lib/systemd/system"
	install -d "${pkgdir}/usr/lib/bgsync"
	
	install -m755 "${srcdir}/bin/bgsync" "${pkgdir}/bin/bgsync"
	install -m755 "${srcdir}/lib/systemd/system/bgsync.service" "${pkgdir}/lib/systemd/system/bgsync.service"
	install -m755 "${srcdir}/usr/lib/bgsync/bgsync.exe" "${pkgdir}/usr/lib/bgsync/bgsync.exe"
	install -m755 "${srcdir}/usr/lib/bgsync/bgsync.service" "${pkgdir}/usr/lib/bgsync/bgsync.service"
	install -m755 "${srcdir}/usr/lib/bgsync/bgsyncedit.dll" "${pkgdir}/usr/lib/bgsync/bgsyncedit.dll"
	install -m755 "${srcdir}/usr/lib/bgsync/bgsynclib.dll" "${pkgdir}/usr/lib/bgsync/bgsynclib.dll"
	install -m755 "${srcdir}/usr/lib/bgsync/ICSharpCode.SharpZipLib.dll" "${pkgdir}/usr/lib/bgsync/ICSharpCode.SharpZipLib.dll"
}
