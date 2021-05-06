# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=7-zip
pkgver=21.02
pkgrel=1
pkgdesc="File archiver with a high compression ratio"
url="https://www.7-zip.org"
license=(LGPL)
arch=(x86_64 i686 aarch64 armv7h)
conflicts=(p7zip)
source_x86_64=(https://www.7-zip.org/a/7z2102-linux-x64.tar.xz)
source_i686=(https://www.7-zip.org/a/7z2102-linux-x86.tar.xz)
source_aarch64=(https://www.7-zip.org/a/7z2102-linux-arm64.tar.xz)
source_armv7h=(https://www.7-zip.org/a/7z2102-linux-arm.tar.xz)
sha256sums_x86_64=('e7f889bf33d3e508d1150a5610ec17aea5b6cde6b4ff3c7bbaa863b771a121b3')
sha256sums_i686=('f182a56fd97d2860a22beb1cf97ecd334a9e8c4bc1cb457042e9ace281d4ee7a')
sha256sums_aarch64=('75421718ec25ade581418253e628c18bd5821ffbeaf6e07997521ec1cfb2ae23')
sha256sums_armv7h=('fe65ecf39f0449dfd201f2e2a2ae9c91d5884ba4e6f6c0d7e8e2a347b80ba298')

package() {
	install -Dt "${pkgdir}"/usr/bin -m0755 7zz
	ln -sf 7zz "${pkgdir}"/usr/bin/7z
	install -Dt "${pkgdir}"/usr/share/licenses/${pkgname} -m0644 License.txt
	install -Dt "${pkgdir}"/usr/share/doc/${pkgname} -m0644 History.txt readme.txt
	cp -r MANUAL "${pkgdir}"/usr/share/doc/${pkgname}/manual
}

