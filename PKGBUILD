# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=kenn-io
_pkgname=forge
pkgname=kenn-${_pkgname}-bin
pkgdesc="Local maintainer console for pull requests, issues, reviews, activity, and local workspaces."

pkgver=0.9.0
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
sha256sums=('3ae17f563f6a88aa02565e88ccb5bd84896c1c3af17b77d3be2606d168fa94f7'
            '4618637c569b4af8847a971a04b03703a393bc06abf3a38fe24b431cf8d2a606')
sha256sums_x86_64=('ce2fc461ef611f76519c02366b8987bf5b168d38a61f1046c9b29957bed929aa')
sha256sums_aarch64=('f6dacebe6d77375c166df7d868df4570d722c7e5acb1dbbc38fbc166a2274303')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "kenn-${_pkgname}" "${pkgdir}/usr/bin/kenn-${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
