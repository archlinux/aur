# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=amber

pkgname=${_appname}-bash-bin
pkgver=0.6.0
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
            'e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118')
sha256sums_x86_64=('578d3d6335aca1bfc902477a1553561990505a8727ecd9b848af20a072867ee4')
sha256sums_aarch64=('b5f3b46cc2f3eaabc51c136eb46d000cbcbf21b68e5efc61926c54ed509fe9ae')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
