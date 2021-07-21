# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=7zip-bin
pkgver=21.03
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
sha256sums_x86_64=('65453f1b5206256df17e01ebac7ecb0ae4c0932025fb1337992ba168f3626e2a')
sha256sums_i686=('5eaabb09b954050185f3ccb436387925909e6e804c923d209d4ca72fb29ba037')
sha256sums_aarch64=('c2dd63fcdbda12eeb38489e6822da0aae5a39af15ea77c7c62570b411d413a04')
sha256sums_armv7h=('df3e04f7fc5e7688219fad2da281008b0e44683db0aa7cb6adb5ee0d054969b4')

package() {
	install -Dt ${pkgdir}/usr/bin -m755 7zz
	install -Dt ${pkgdir}/usr/share/doc/${pkgname%-bin} -m644 History.txt readme.txt
	cp -r MANUAL ${pkgdir}/usr/share/doc/${pkgname%-bin}/manual
	install -Dm644 License.txt ${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE
}
# vim:set ts=4 sw=4:
