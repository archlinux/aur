# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=KarlVM12
_pkgname=dimensions
pkgname=${_pkgname}-bin
pkgdesc="Terminal Tab Manager - Organize your terminal workflows with an interactive TUI"

pkgver=0.2.17
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-musl' 'aarch64-unknown-linux-musl')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md" "CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}")
sha256sums=('601106ec230e339989c3eabb474fab35ea66274063e387b00540e943c7700e83'
            '798bebeee902541fab89ddf981e2e8770004bb38c4661242d64912cf71784296')
sha256sums_x86_64=('bbd7a564dbd296bc1eb6566ae1655ca066fb3c23f851058051936dd52a7126f4')
sha256sums_aarch64=('e0f536a2bd2afb9abbe62dbca63bed569166bf7ace58b4181e77246728d89f0f')



package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
