# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=7-zip
pkgver=21.01
pkgrel=4
pkgdesc="File archiver with a high compression ratio"
url="https://www.7-zip.org"
license=(LGPL)
arch=(x86_64 i686 aarch64 armv7h)
conflicts=(p7zip)
source_x86_64=(https://www.7-zip.org/a/7z2101-linux-x64.tar.xz)
source_i686=(https://www.7-zip.org/a/7z2101-linux-x86.tar.xz)
source_aarch64=(https://www.7-zip.org/a/7z2101-linux-arm64.tar.xz)
source_armv7h=(https://www.7-zip.org/a/7z2101-linux-arm.tar.xz)
sha256sums_x86_64=('63c93537b8fad1353c278e275ee0e9cd7f30bc7edd1fa44543f2478752b7caf9')
sha256sums_i686=('d2e316bd1fda6bddd465523888244e10733ddc5e7d6c5d36bb22a2460b7adb4c')
sha256sums_aarch64=('318bb98eb3ec748c4d92ccac97f4d304767ae2baddb9ed59f34a88756d7c4628')
sha256sums_armv7h=('a142caaa9f9c66f70ede239ed8c953978eee0c7ab1c3b932ca06551977822a12')

package() {
	install -Dt "${pkgdir}"/usr/bin -m0755 7zz
	ln -sf 7zz "${pkgdir}"/usr/bin/7z
	install -Dt "${pkgdir}"/usr/share/licenses/${pkgname} -m0644 License.txt
	install -Dt "${pkgdir}"/usr/share/doc/${pkgname} -m0644 History.txt readme.txt
	cp -r MANUAL "${pkgdir}"/usr/share/doc/${pkgname}/manual
}

