# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=7zip-bin
pkgver=21.02
pkgrel=1
pkgdesc="Command-line file archiver with high compression ratio (official build)."
arch=(x86_64 i686 aarch64 armv7h)
url="https://www.7-zip.org"
license=('LGPL')
provides=("${pkgname%-bin}" "7-zip")
conflicts=("${pkgname%-bin}" "7-zip")
source_x86_64=(https://www.7-zip.org/a/7z${pkgver//./}-linux-x64.tar.xz)
source_i686=(https://www.7-zip.org/a/7z${pkgver//./}-linux-x86.tar.xz)
source_aarch64=(https://www.7-zip.org/a/7z${pkgver//./}-linux-arm64.tar.xz)
source_armv7h=(https://www.7-zip.org/a/7z${pkgver//./}-linux-arm.tar.xz)
sha256sums_x86_64=('e7f889bf33d3e508d1150a5610ec17aea5b6cde6b4ff3c7bbaa863b771a121b3')
sha256sums_i686=('f182a56fd97d2860a22beb1cf97ecd334a9e8c4bc1cb457042e9ace281d4ee7a')
sha256sums_aarch64=('75421718ec25ade581418253e628c18bd5821ffbeaf6e07997521ec1cfb2ae23')
sha256sums_armv7h=('fe65ecf39f0449dfd201f2e2a2ae9c91d5884ba4e6f6c0d7e8e2a347b80ba298')

package() {
	install -Dt ${pkgdir}/usr/bin -m755 7zz
	install -Dt ${pkgdir}/usr/share/doc/${pkgname%-bin} -m644 History.txt readme.txt
	cp -r MANUAL ${pkgdir}/usr/share/doc/${pkgname%-bin}/manual
	install -Dm644 License.txt ${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE
}
# vim:set ts=4 sw=4:
