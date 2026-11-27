# Maintainer: David Henning <dev@webcodr.io>
pkgname=jwtd-bin
pkgver=5.8.0
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
sha256sums_x86_64=('8ae8946a7139f2b3887e875439068def8e295ae3c4178c3c010f216b57905b0c')
source_aarch64=("jwtd-${pkgver}-aarch64.tar.gz::https://github.com/webcodr/jwtd/releases/download/v${pkgver}/jwtd-linux-arm64.tar.gz")
sha256sums_aarch64=('c026ff1e5fd8cfa581c450a19ec52cda114c2798b54b29b62fb5a24bc3212461')

package() {
	install -Dm755 "${srcdir}/jwtd" "${pkgdir}/usr/bin/jwtd"
	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
