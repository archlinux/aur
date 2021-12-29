# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=7-zip-bin
pkgver=21.07
pkgrel=1
pkgdesc="Command-line file archiver with high compression ratio (official build)."
arch=(x86_64 i686 aarch64 armv7h)
url="https://www.7-zip.org"
license=('LGPL')
provides=("${pkgname%-bin}" "7zip" "p7zip")
conflicts=("${pkgname%-bin}" "7zip" "p7zip")
replaces=('7zip-bin')
source_x86_64=(https://www.7-zip.org/a/7z${pkgver//./}-linux-x64.tar.xz)
source_i686=(https://www.7-zip.org/a/7z${pkgver//./}-linux-x86.tar.xz)
source_aarch64=(https://www.7-zip.org/a/7z${pkgver//./}-linux-arm64.tar.xz)
source_armv7h=(https://www.7-zip.org/a/7z${pkgver//./}-linux-arm.tar.xz)
sha512sums_x86_64=('ca84ea7627434e9fd4a56ad3d98168e039d495757277abbbd7906dbea5e053fa4a5224f543ee66189e42229723b948d676cfc0e483f57b6b3e7838bec60d5f4e')
sha512sums_i686=('fc02efb1e6c9e19d69314467035d2598a6379bdfac27a8d22c33a418790b7d920d42bc6a1e24e47e1006f9fae32a2fcb49d0165b6f30115468aadd1f64129219')
sha512sums_aarch64=('ba66afd9999d82c13c28900095eaef492e27fd01b986b874a93920b37be042ee4aaaf807ae285090014641ab0ecb328d5d91f5532bf91f05d29ccc6c2f31ae71')
sha512sums_armv7h=('fba0858ef75c9b2cfa969f789595d060a92498e8cbaa89d147432cb6dc374a70c6d51698fa82cc7bd782709267658e04dd9734b78b28f0c70293267e2939b928')

package() {
	install -Dt ${pkgdir}/usr/bin -m755 7zz
	install -Dt ${pkgdir}/usr/bin -m755 7zzs
	ln -sf 7zz ${pkgdir}/usr/bin/7z
	install -Dt ${pkgdir}/usr/share/doc/${pkgname%-bin} -m644 History.txt readme.txt
	cp -r MANUAL ${pkgdir}/usr/share/doc/${pkgname%-bin}/manual
	install -Dm644 License.txt ${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE
}
# vim:set ts=4 sw=4:
