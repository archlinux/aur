# Maintainer: Márk Sági-Kazár <mark.sagi-kazar@gmail.com>

pkgname=nodenv
pkgver=1.0.0
pkgrel=2
pkgdesc="Manage multiple NodeJS versions"
arch=("any")
url="https://github.com/nodenv/nodenv"
license=("MIT")
optdepends=("nodenv-node-build")
conflicts=("${pkgname}-git")
install=nodenv.install
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=("7750715a580d81ea9a8a63def8131b6b")

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	mkdir -p "${pkgdir}/usr/lib/${pkgname}/completions"
	install -m 644 ./completions/* "${pkgdir}/usr/lib/${pkgname}/completions/"

	mkdir -p "${pkgdir}/usr/lib/${pkgname}/libexec"
	install -m 755 ./libexec/* "${pkgdir}/usr/lib/${pkgname}/libexec/"

	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/usr/lib/${pkgname}/libexec/${pkgname}" "${pkgdir}/usr/bin/"
}
