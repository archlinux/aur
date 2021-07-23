# Maintainer: A. Husen <hi@husen.id>
pkgname=code-minimap-bin
_pkgname=code-minimap
pkgver=0.6.1
pkgrel=3
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
sha512sums_x86_64=('9181d9c4c041a3b6db306992c25d03c983951fb19e1994b55ec74f08217d0b47a8d8515024e69a20a69c12880684c9c332e97fbf0efd58d17a2609b942c66ecf')
sha512sums_i686=('b6da73f9d3bab81edd7f1c33df6b8b48d673246e6be83dc2d1060f563143cbe6432b7d1b9d0a21f907ecf322ea6b945703389088423629cc95727a8260db990c')
sha512sums_aarch64=('128ab820afdd5df538a0ea4b30e27aee35e301eff37396ad1ff662428af487de0a94be1b8e80815be8fa514769aaddf1804f957745d3d1ca05397415b7979f14')
sha512sums_arm=('4d5c9dfbbef6e2cd7e939ab2e109be3e501231e94a3505d3d186ac85ec8a6bcf06a26d168feca1cfe4e5e0dbb00d6ea5e75187711b61aa6ec74fac51e98c5351')

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
