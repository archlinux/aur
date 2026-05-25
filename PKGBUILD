# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Squirreljetpack
_pkgname=matchmaker
_execname=mm
pkgname=${_pkgname}-bin
pkgdesc="A fast, configurable and intuitive fuzzy searcher"

pkgver=0.0.32
pkgrel=1
_pkgvername=${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('GPL-3.0')

provides=("${_execname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("README-${pkgver}.md::${_urlraw}/${_pkgname}-cli/README.md"
		"LICENSE-${pkgver}::${_urlraw}/${_pkgname}-lib/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-linux.tar.gz")
sha256sums=('8abc0efcc5f056178dc530c9b86869f63d1cd17b0fbea5d2cd0cad07501d955a'
            'd0b72bc24eb472035c25af6eff3946409fe62609ce40cfd21746af992cf8a8d4')
sha256sums_x86_64=('a747c91367b9f56ded5d3e600d4fc5ce8a28def04523a355b1c96d21ea7a4772')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "target/release/${_execname}" "${pkgdir}/usr/bin/${_execname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
