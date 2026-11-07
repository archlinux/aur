# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=kenn-io
_pkgname=forge
pkgname=kenn-${_pkgname}-bin
pkgdesc="Local maintainer console for pull requests, issues, reviews, activity, and local workspaces."

pkgver=0.6.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("kenn-${_pkgname}")
conflicts=("kenn-${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums=('c099337213838bbfeb7567d493c0c7a25b2d77cf6a1868099b66eb67db79d13c'
            'cb03f5511781719ba3f56d474ada3f08d221f620e2ff384175690fc54122f6ba')
sha256sums_x86_64=('61a2a7159f29531ba63f206b0b0bafeb09b94eb3b01b7727d81144f82fe78366')
sha256sums_aarch64=('45786288c8907ea2110b039953fe8e9ba1bb4a148f1132d31f78a73f6712f35f')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "kenn-${_pkgname}" "${pkgdir}/usr/bin/kenn-${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
