# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=paramientos
_pkgname=presto
pkgname=${_pkgname}-bin
pkgdesc="Presto is a dependency manager for PHP and drop-in-replacement for Composer"

pkgver=0.1.11
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

options=(!strip)

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[1]}")
sha256sums=('fc776d17dc4517972c9be767e1ec355c324867bc92bfa9b49a9403ad3770a7e6'
            '73496093fa9eb666ddd2b81bde20166ff90a4e68c61f0c7d64c67b2d9cc4022d')
sha256sums_x86_64=('b6b116665e1ad5df403713e8b586d7eeda30ce86451f07d3d4b84f7412e5bc32')
sha256sums_aarch64=('265b43462d4048c2408095d1bb59ec3dda2009299879ba0bb6694882786f3ee5')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
