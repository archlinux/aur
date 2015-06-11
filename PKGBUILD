# Contributor: nullren
# Contributor: N. Izumi - izmntuk
pkgname=symlinks
pkgver=1.4.3
pkgrel=2
pkgdesc='Scan and change symbolic links'
arch=('i686' 'x86_64' 'armv7h')
depends=('glibc')
conflicts=("${pkgname}-git")
url="https://github.com/brandt/${pkgname}"
license=('MIT')
source=("https://github.com/brandt/${pkgname}/archive/v${pkgver}.tar.gz")

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -dm755 "${pkgdir}/usr/bin"
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
	install -dm755 "${pkgdir}/usr/share/${pkgname}"
	install -dm755 "${pkgdir}/usr/share/man/man8"
	install -Dm644 Readme.md "${pkgdir}/usr/share/${pkgname}/README.md"
	install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -m755 symlinks "${pkgdir}/usr/bin/"
	install -m644 symlinks.8 "${pkgdir}/usr/share/man/man8"
}

sha1sums=('f4f0115b0c468ac4a44a4bfe378f1921383c8f6d')
sha256sums=('27105b2898f28fd53d52cb6fa77da1c1f3b38e6a0fc2a66bf8a25cd546cb30b2')
