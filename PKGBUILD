# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=7-zip-bin
pkgver=21.07
pkgrel=2
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
sha256sums_x86_64=('4e2499064413ea66c6b83beb994f0ea4ee87b1ec80188188db62a6ec7e74d300')
sha256sums_i686=('793fa3173680db56e3abbdddaf3920b8f6c4550e537690d53a42c5fa9d8b8722')
sha256sums_aarch64=('2f9e9dd7e79d154782ac45d26e4fdc94a491e495a2d12c986c7e23f03ea26d13')
sha256sums_armv7h=('9016721700eb6d90c45ff59fd4c1ed9539ef9021241aa3ec2dd48a941b688675')

package() {
	install -D -t "${pkgdir}/usr/bin" -m 755 7zz
	install -D -t "${pkgdir}/usr/bin" -m 755 7zzs
	install -D -t "${pkgdir}/usr/share/doc/${pkgname%-bin}" -m 644 History.txt readme.txt
	cp -r MANUAL  "${pkgdir}/usr/share/doc/${pkgname%-bin}/manual"
	install -D -m 644 License.txt "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
# vim:set ts=4 sw=4 et:
