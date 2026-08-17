# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=kenn-io
_pkgname=forge
pkgname=kenn-${_pkgname}-bin
pkgdesc="Local maintainer console for pull requests, issues, reviews, activity, and local workspaces."

pkgver=0.2.0
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
sha256sums=('c050fefa411634786f122e05d02980f67ce61251e1c9f6a7176586f617a85187'
            'cb03f5511781719ba3f56d474ada3f08d221f620e2ff384175690fc54122f6ba')
sha256sums_x86_64=('06e5fe553fbb51d6b5cc9801ccd97d321020f5b7b4c0474b5b7ad1e9fb9e84af')
sha256sums_aarch64=('5f4732608c21fd8829f42bccbf77ecf4274df913345e4b0aa98db97c72c90fe3')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "kenn-${_pkgname}" "${pkgdir}/usr/bin/kenn-${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
