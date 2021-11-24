# Maintainer: A. Husen <hi@husen.id>
pkgname=code-minimap-bin
_pkgname=code-minimap
pkgver=0.6.2
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
sha512sums_x86_64=('7bde848beb5a12d4af03468d700dc28f6a0de92ca6324a797708cd9566d475cf62a3a5b892440adb2b8bacd48182d011e9f37fe8951be8dc441e1cc78c8e5974')
sha512sums_i686=('e030d927aa125ff659fbf761944b13d5056e5bb380e1a9addaa1471babb65fa3140d9dfa5b93d51eacb7fc4b9fade022ed896d6fbfec74f727323e82689dc70d')
sha512sums_aarch64=('753bd25ddf88f0fd8244b0e19b3c5ed4d8d47db91273432944d45fdf052b686a4a7a1725015473dbd916b0cd8f4442cdfdbd81bf859ad5a0b1045f7c9cdceaf1')
sha512sums_arm=('d5680c0d0b390161a0204d9431070cce13f7b80424786ba2838f8b7780d166149aff8290be49603bda812dbd4d218ade8767ced0cbef9571014acc534df96833')

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
