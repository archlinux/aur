# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Squirreljetpack
_pkgname=matchmaker
_execname=mm
pkgname=${_pkgname}-bin
pkgdesc="A fast, configurable and intuitive fuzzy searcher"

pkgver=0.0.22
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
sha256sums=('a4a8e7f3877129cc705a5e6866d801e5cce4bc9700b96af01e7299f130f40884'
            'd0b72bc24eb472035c25af6eff3946409fe62609ce40cfd21746af992cf8a8d4')
sha256sums_x86_64=('fc42227c86115fe75f77eebb380db1dfcee9ddc41e2a6f95736ee4bc24da99b0')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "target/release/${_execname}" "${pkgdir}/usr/bin/${_execname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
