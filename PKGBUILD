# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Adarsh-codesOP
_pkgname=Klein
pkgname=${_pkgname,,}-bin
pkgdesc="A terminal-based TUI text editor designed to bring the look and functionality of a modern IDE into the terminal"

pkgver=0.3.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('Apache-2.0')

depends=('glibc' 'libgcc')
provides=("${_pkgname,,}")
conflicts=("${_pkgname,,}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[1]}.tar.gz")
sha256sums=('5f769458fde01d57041bf37bf29b85c139dd3f7c0a7d293f4e0ad4d926f64bb2'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('3bbb7b0df66d8a03285df99a2116555100e8318e96491e3f1152708db05b2221')
sha256sums_aarch64=('271cbda991d1c66984529e229a7f735b64fcd4ba4c6468326661010dfa129f15')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname,,}" "${pkgdir}/usr/bin/${_pkgname,,}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
