# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=j178
_pkgname=prek
pkgname=${_pkgname}-bin
pkgver=0.5.3
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="⚡ Better 'pre-commit', re-engineered in Rust"
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('gcc-libs' 'glibc')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}-unknown-linux-gnu.tar.gz")
sha256sums=('08215c44c901c7edf78c3a2b1e02558b0646a3ffa8161be0c112acfd3fb0c100'
            '559a69c8c17870127521c5cca6b243864d66de0523b818419d66207e2f8b4bbe'
            '2836477a890a64713b5b626262d6555bf5a9a6e317d56f021a2a8c7d4e13e68b')
sha256sums_x86_64=('c1475ddc56df0003c780557d9b52273d9eb19c9ef8d91143f3ce03511182a36e')
sha256sums_aarch64=('4cfc936895e8b4e1e2f92daca61bb7c8eb123bac14585ba9f706b599776cdcc8')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-unknown-linux-gnu/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
