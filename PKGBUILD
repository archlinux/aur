# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=asinglebit
_pkgname=guitar
pkgname=${_pkgname}-tui-bin
pkgdesc="A terminal based git client with fast topological & chronological graph rendering"

pkgver=0.1.39
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('GPL-3.0-or-later')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs' 'zlib' 'openssl' 'git')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux")
sha256sums=('36874402d076b70d59c8a9db16bf8c9ca55a5b5b3cfc3906cd9fd390a679a608'
            'f37fd448332e5175a0045a65450a2779a3a557713b5fd036c79a28a1f0a3e502')
sha256sums_x86_64=('9d6c84661a37166e59e37b164b0df72b615ed666f406a5d5371194696016fb83')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
