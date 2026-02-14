# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=caelansar
_pkgname=termirs
pkgname=${_pkgname}-bin
pkgdesc="A modern, async SSH terminal client"

pkgver=0.2.10
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}-unknown-linux-musl.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[1]}-unknown-linux-musl.tar.gz")
sha256sums=('c2ebfd5271fc48667a40415fc0b01daf0e1d812a0fd33b36f6f9bc2bd7e052c3'
            'c3beea7db756bbaa567bb739369946ac1a12582576696feac58f36fce425a8e8')
sha256sums_x86_64=('6c10502de676f05a9f279d926b0e06223c38cd598168a93a01507820f45e8d99')
sha256sums_aarch64=('2599626f232e9fddee5f4c0a92ee16aebadcffcb4f96bdf24b4e5e53d4c39ec2')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
