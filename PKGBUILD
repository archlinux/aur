# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=7-zip
pkgver=21.01
pkgrel=3
pkgdesc="File archiver with a high compression ratio"
url="https://www.7-zip.org"
license=(LGPL)
arch=(x86_64)
conflicts=(p7zip)
source=(https://www.7-zip.org/a/7z2101-linux-x64.tar.xz)
sha256sums=('63c93537b8fad1353c278e275ee0e9cd7f30bc7edd1fa44543f2478752b7caf9')

package() {
	install -Dt "${pkgdir}"/usr/bin -m0755 7zz
	ln -sf 7zz "${pkgdir}"/usr/bin/7z
	install -Dt "${pkgdir}"/usr/share/licenses/${pkgname} -m0644 License.txt
	install -Dt "${pkgdir}"/usr/share/doc/${pkgname} -m0644 History.txt readme.txt
	cp -r MANUAL "${pkgdir}"/usr/share/doc/${pkgname}/manual
}

