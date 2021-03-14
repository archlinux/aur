# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=7zip-bin
pkgver=21.01
pkgrel=1
pkgdesc="Command-line file archiver with high compression ratio (official build)."
arch=(x86_64)
url="https://www.7-zip.org"
license=('LGPL')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}.tar.xz::https://www.7-zip.org/a/7z${pkgver//./}-linux-x64.tar.xz")
sha256sums=('63c93537b8fad1353c278e275ee0e9cd7f30bc7edd1fa44543f2478752b7caf9')

package() {
	install -Dm755 7zz ${pkgdir}/usr/bin/7zz
	install -d ${pkgdir}/usr/share/doc/${pkgname%-bin}
	cp -a MANUAL History.txt readme.txt ${pkgdir}/usr/share/doc/${pkgname%-bin}/
	install -Dm644 License.txt ${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE
}
# vim:set ts=4 sw=4:
