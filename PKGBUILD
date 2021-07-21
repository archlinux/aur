# Maintainer: A. Husen <hello@husen.id>
pkgname=code-minimap-bin
_pkgname=code-minimap
pkgver=0.6.1
pkgrel=1
pkgdesc="A high performance code minimap render."
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/wfxr/code-minimap"
license=('MIT' 'APACHE')
provides=('code-minimap')
conflicts=('code-minimap')
source_x86_64=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v$pkgver/code-minimap-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_i686=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v$pkgver/code-minimap-v$pkgver-i686-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v$pkgver/code-minimap-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha512sums_x86_64=('9181d9c4c041a3b6db306992c25d03c983951fb19e1994b55ec74f08217d0b47a8d8515024e69a20a69c12880684c9c332e97fbf0efd58d17a2609b942c66ecf')
sha512sums_i686=('9181d9c4c041a3b6db306992c25d03c983951fb19e1994b55ec74f08217d0b47a8d8515024e69a20a69c12880684c9c332e97fbf0efd58d17a2609b942c66ecf')
sha512sums_aarch64=('9181d9c4c041a3b6db306992c25d03c983951fb19e1994b55ec74f08217d0b47a8d8515024e69a20a69c12880684c9c332e97fbf0efd58d17a2609b942c66ecf')

package() {
    cd "$srcdir/"${_pkgname}-"v"${pkgver}*

    install -Dm755 $_pkgname "${pkgdir}/usr/bin/${_pkgname}"	

    install -Dm644 "completions/bash/${_pkgname}.bash"  "$pkgdir/usr/share/bash-completion/completions/${_pkgname}.bash"
    install -Dm644 "completions/fish/${_pkgname}.fish"  "$pkgdir/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
    install -Dm644 "completions/zsh/_${_pkgname}"	"$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"

    install -Dm644 "README.md"				"$pkgdir/usr/share/doc/${_pkgname}/README.md"

    install -Dm644 "LICENSE-MIT"			"$pkgdir/usr/share/licenses/${_pkgname}/LICENSE-MIT"
    install -Dm644 "LICENSE-APACHE"		        "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE-APACHE"
}

