# Maintainer: David Henning <dev@webcodr.io>
pkgname=jwtd-bin
pkgver=4.0.3
pkgrel=1
pkgdesc="Decode and pretty-print JSON Web Tokens with syntax highlighting"
arch=('x86_64' 'aarch64')
url="https://github.com/webcodr/jwtd"
license=('MIT')
provides=('jwtd')
conflicts=('jwtd')
# The released archives use version-free names, so the download filenames are
# pinned to ${pkgver} to keep makepkg's source cache from colliding across
# versions. The LICENSE is fetched from the tag because the archives ship the
# binary only.
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/webcodr/jwtd/v${pkgver}/LICENSE")
sha256sums=('e7d4d4a62b2b6a2b38cf9aa43f4e4613a63a261a4444d9dd89d5b89d6cebf7aa')
source_x86_64=("jwtd-${pkgver}-x86_64.tar.gz::https://github.com/webcodr/jwtd/releases/download/v${pkgver}/jwtd-linux-amd64.tar.gz")
sha256sums_x86_64=('fc370a4dee8791d087cc31633bc8925b57247056a0a08ed40d110ff4849aec63')
source_aarch64=("jwtd-${pkgver}-aarch64.tar.gz::https://github.com/webcodr/jwtd/releases/download/v${pkgver}/jwtd-linux-arm64.tar.gz")
sha256sums_aarch64=('e01d7c1ae3708744a019e20934c0e2ab0408ed0af476cf892164e2069ee8dfbc')

package() {
	install -Dm755 "${srcdir}/jwtd" "${pkgdir}/usr/bin/jwtd"
	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
