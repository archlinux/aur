# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=kenn-io
_pkgname=forge
pkgname=kenn-${_pkgname}-bin
pkgdesc="Local maintainer console for pull requests, issues, reviews, activity, and local workspaces."

pkgver=0.3.0
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
sha256sums=('baec51e554ec172db7e2f4e54c823210916e6a2a069856a28281a7253c1862eb'
            'cb03f5511781719ba3f56d474ada3f08d221f620e2ff384175690fc54122f6ba')
sha256sums_x86_64=('987d76ed83e8d164610a832707af9fab1117c9bdfda48b5cd90c60413ddb359e')
sha256sums_aarch64=('a682eee572232afdf78102fb3d4071f9d56544914b703000d874b8410355f9c9')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "kenn-${_pkgname}" "${pkgdir}/usr/bin/kenn-${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
