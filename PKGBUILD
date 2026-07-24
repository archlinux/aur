# Maintainer: David Henning <dev@webcodr.io>
pkgname=jwtd-bin
pkgver=4.0.2
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
sha256sums_x86_64=('2581cc1f0388bf6972576c3e089fe83792c9b03f8961e60ae0cd8a3620931547')
source_aarch64=("jwtd-${pkgver}-aarch64.tar.gz::https://github.com/webcodr/jwtd/releases/download/v${pkgver}/jwtd-linux-arm64.tar.gz")
sha256sums_aarch64=('c296cc419d6ef6a695fcbd33037b136d66cfc2631c663d4000c761cf31dded24')

package() {
	install -Dm755 "${srcdir}/jwtd" "${pkgdir}/usr/bin/jwtd"
	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
