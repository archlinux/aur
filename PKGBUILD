# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=7-zip-bin
pkgver=22.01
pkgrel=1
pkgdesc="File archiver with high compression ratio (official build)."
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
sha256sums_x86_64=('2c266f6794adec310c4631232c1d039f46988d51082fe5e80349c52ee7ed60bb')
sha256sums_i686=('bc077186db2b435b9c7a05973f1cf3b4196484bd08ebcb1ddba159bc94ca5b54')
sha256sums_aarch64=('23d060f6b1f4460b81b033b9cb91afc0501ef041eb1b569dd37e60897b052f01')
sha256sums_armv7h=('428c11efd91fe1809c4750e8cd5d6eddfbed2826d8a5399ffcacb849f0d21cf8')

package() {
	install -D -t "${pkgdir}/usr/bin" -m 755 7zz
	install -D -t "${pkgdir}/usr/bin" -m 755 7zzs
	install -D -t "${pkgdir}/usr/share/doc/${pkgname%-bin}" -m 644 History.txt readme.txt
	cp -r MANUAL  "${pkgdir}/usr/share/doc/${pkgname%-bin}/manual"
	install -D -m 644 License.txt "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
# vim:set ts=4 sw=4 et:
