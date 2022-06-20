# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=7-zip-bin
pkgver=22.00
pkgrel=1
pkgdesc="Command-line file archiver with high compression ratio (official build)."
arch=(x86_64 i686 aarch64 armv7h)
url="https://www.7-zip.org"
license=('LGPL')
provides=("${pkgname%-bin}" "7zip")
conflicts=("${pkgname%-bin}" "7zip")
replaces=('7zip-bin')
source_x86_64=("${url}/a/7z${pkgver//./}-linux-x64.tar.xz")
source_i686=("${url}/a/7z${pkgver//./}-linux-x86.tar.xz")
source_aarch64=("${url}/a/7z${pkgver//./}-linux-arm64.tar.xz")
source_armv7h=("${url}/a/7z${pkgver//./}-linux-arm.tar.xz")
sha256sums_x86_64=('5290409e7bbe2f133d0bd7e7482548678157ea2be276b0f9cb440600f4be9a2d')
sha256sums_i686=('3f3df18960079df961cfd34b20c32c673bbafb1228785c91d8446257ba3438ae')
sha256sums_aarch64=('be953c5fe67843d3ae5b30109da82d0ca8becd7087723f7529dbcb0b7170e1a8')
sha256sums_armv7h=('7c2a78cc44ffc8066133cba16579b2a564109fedeb2ffdafa67c6414f48b9ffa')

package() {
	install -D -t "${pkgdir}/usr/bin" -m 755 7zz
	install -D -t "${pkgdir}/usr/bin" -m 755 7zzs
	install -D -t "${pkgdir}/usr/share/doc/${pkgname%-bin}" -m 644 History.txt readme.txt
	cp -r MANUAL  "${pkgdir}/usr/share/doc/${pkgname%-bin}/manual"
	install -D -m 644 License.txt "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
# vim:set ts=4 sw=4 et:
