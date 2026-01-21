# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=andrewmd5
_pkgname=dawn
pkgname=${_pkgname}-bin
pkgdesc="A distraction-free writing environment; draft anything, write now"

pkgver=0.1.3
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x64' 'arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc' 'curl')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[1]}.tar.gz")
sha256sums=('95abc9ebd3891747ce796e94e9993492283c0719aa01d172a905f73d93eeff35'
            '33006297efc9fdec255eae33ffa3819c64941fee4641995714361356ba2e5a8a')
sha256sums_x86_64=('a9a59e3cfe24bc935be11a9638123bb100bd7c4f3901db23b379a83778430d61')
sha256sums_aarch64=('81b78c08c9280d0ebcb7af392ff72b01b9d3f844cfb0e2d524a2eaf2b0181f54')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
