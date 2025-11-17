# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=unhappychoice
_pkgname=gitlogue
pkgname=${_pkgname}-bin
pkgver=0.1.0
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="A cinematic Git commit replay tool for the terminal, turning your Git history into a living, animated story"
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('ISC')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('gcc-libs' 'glibc' 'zlib' 'git')

source=("README-${pkgver}.md::${_urlraw}/README.md"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "LICENSE-THIRD-PARTY-${pkgver}::${_urlraw}/LICENSE-THIRD-PARTY")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[1]}-unknown-linux-gnu.tar.gz")
sha256sums=('b7bf1f34afb2376232641a971a12c2ba73b0671d41844f8c03634131c2edb7f2'
            '8f7d4feb676b3700f48611aa9a3c8e444b7877593efb52fc90235577f3148cc9'
            'd8e89661543578eaeaadf859a4b067c639775cdabd809eebabf7aad866bfda72')
sha256sums_x86_64=('6b00de6bf47615dd357afd65ee754989626029ed718376203d5e4069a6e4baf6')
sha256sums_aarch64=('1938fcfd7bd57af64aa8033952140bee7932f11bd90ce6f3b7ecdb0557f8d53f')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "LICENSE-THIRD-PARTY-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-THIRD-PARTY"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
