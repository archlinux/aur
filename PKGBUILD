# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=amber

pkgname=${_appname}-bash-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="The programming language compiled to bash"

url="https://amber-lang.com/"
arch=('x86_64' 'aarch64')
license=('LGPL-3.0')

provides=("${_appname}")
depends=('libgcc' 'glibc')
conflicts=("${pkgname%%-bin}")

source=("README-${pkgver}.md::https://raw.githubusercontent.com/amber-lang/amber/${pkgver}-alpha/README.md"
		"LICENSE-${pkgver}::https://raw.githubusercontent.com/amber-lang/amber/${pkgver}-alpha/LICENSE.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.txz::https://github.com/amber-lang/${_appname}/releases/download/${pkgver}-alpha/${_appname}-linux-gnu-${arch[0]}.tar.xz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.txz::https://github.com/amber-lang/${_appname}/releases/download/${pkgver}-alpha/${_appname}-linux-gnu-${arch[1]}.tar.xz")

sha256sums=('93f4c218cd385c90e7ba1c22b66d8458dd47c648b1c4ff2b2261467ce6a2572e'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('4deaaa2d63aa4addcf8514efa11446f76ac998b7ccbb290eb821966c82992729')
sha256sums_aarch64=('c1ecad1e98404fd0e1d8817e11feeabb8cc3061d1229d5b963ba204fad3ed671')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
