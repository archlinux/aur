# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=7-zip-bin
pkgver=21.04
pkgrel=1
pkgdesc="Command-line file archiver with high compression ratio (official build)."
arch=(x86_64 i686 aarch64 armv7h)
url="https://www.7-zip.org"
license=('LGPL')
provides=("${pkgname%-bin}" "p7zip")
conflicts=("${pkgname%-bin}" "p7zip")
source_x86_64=(https://www.7-zip.org/a/7z${pkgver//./}-linux-x64.tar.xz)
source_i686=(https://www.7-zip.org/a/7z${pkgver//./}-linux-x86.tar.xz)
source_aarch64=(https://www.7-zip.org/a/7z${pkgver//./}-linux-arm64.tar.xz)
source_armv7h=(https://www.7-zip.org/a/7z${pkgver//./}-linux-arm.tar.xz)
sha256sums_x86_64=('5092d60bf4a27777830a9619898999b37851b33acbd518d1c9525a9fc3cb4255')
sha256sums_i686=('d6beceac97b84f60411e84c686a9a7e3b3c2e8241a83bc5d833f7e8120fbf333')
sha256sums_aarch64=('f62ff6ef84d90a028256e12f0680b8a2d6f9c66e1a0d634687a1f8652d9a2655')
sha256sums_armv7h=('f752a116ab5a98ae45388a61830c6c09bab691b0bc3be11b962f165ba5b603ed')

package() {
	install -Dt ${pkgdir}/usr/bin -m755 7zz
	ln -sf 7zz ${pkgdir}/usr/bin/7z
	install -Dt ${pkgdir}/usr/share/doc/${pkgname%-bin} -m644 History.txt readme.txt
	cp -r MANUAL ${pkgdir}/usr/share/doc/${pkgname%-bin}/manual
	install -Dm644 License.txt ${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE
}
# vim:set ts=4 sw=4:
