# Maintainer: A. Husen <hi@husen.id>
pkgname=code-minimap-bin
_pkgname=code-minimap
pkgver=0.6.4
pkgrel=1
pkgdesc="A high performance code minimap render."
arch=('x86_64' 'i686' 'aarch64' 'arm')
url="https://github.com/wfxr/code-minimap"
license=('MIT' 'APACHE')
provides=('code-minimap')
conflicts=('code-minimap')
source_x86_64=("${url}/releases/download/v$pkgver/code-minimap-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_i686=("${url}/releases/download/v$pkgver/code-minimap-v$pkgver-i686-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v$pkgver/code-minimap-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
source_arm=("${url}/releases/download/v$pkgver/code-minimap-v$pkgver-arm-unknown-linux-gnueabihf.tar.gz")
sha512sums_x86_64=('f76bf538d95ca26f2d5b639a634d4b432041f64cc1e72f19c1dfab0f28c72fa08f912d31e894b31f0692153255b94f9541f5734e9e35508ce207b50dd446b433')
sha512sums_i686=('a6982924ee321298c5f1dbcae8bc6f220eb39bd50704884655ffbaa26595e3edbc1bf67738df5e4e23d06e154a2d63c8c28412bc0d3e2c66b30a37183ebc99c6')
sha512sums_aarch64=('cc238aae185771af0e1d9e6e9764bd5ad056aa71777074041c92b1f915c531d353d3654b2d89ed013274fafb608c14b9e0577c15df05d210af27e274119fb538')
sha512sums_arm=('e39d32ed1ed282e0654d1e1999152ea4fecdf1915c999b697a048fa01f882b3e16f9eece7cd795531dcd0501ac3cc30f8e706314a3ce68f18cd63f8d59ca98b3')

package() {
    cd "$srcdir"

    install -Dm755 ${_pkgname}-"v"${pkgver}"-"*"/"$_pkgname                            "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 ${_pkgname}-"v"${pkgver}"-"*"/completions/bash/${_pkgname}.bash"     "$pkgdir/usr/share/bash-completion/completions/${_pkgname}.bash"
    install -Dm644 ${_pkgname}-"v"${pkgver}"-"*"/completions/fish/${_pkgname}.fish"     "$pkgdir/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
    install -Dm644 ${_pkgname}-"v"${pkgver}"-"*"/completions/zsh/_${_pkgname}"	        "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"

    install -Dm644 ${_pkgname}-"v"${pkgver}"-"*"/README.md"				                "$pkgdir/usr/share/doc/${_pkgname}/README.md"

    install -Dm644 ${_pkgname}-"v"${pkgver}"-"*"/LICENSE-MIT"			                "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE-MIT"
    install -Dm644 ${_pkgname}-"v"${pkgver}"-"*"/LICENSE-APACHE"		                "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE-APACHE"
}
