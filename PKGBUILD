# Maintainer: A. Husen <hello@husen.id>
pkgname=code-minimap-bin
_pkgname=code-minimap
pkgver=0.6.0
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
sha512sums_x86_64=('3a03ba0c25c6304e4e8d871f583b5bc111e7bf6a52308e3e6615d2f088c052ce5ac4b27271fa514a97920f711a85ce9e410c3edf7c185d00e36d72d45883768d')
sha512sums_i686=('9612c942bc5c099304ca80909ab3fe09c303f83e5d8324a112f6b4b657d59a41fb513f2a0e4edddb5c737e8aef3d7b417719c94c0585637534936f4e3671d5bb')
sha512sums_aarch64=('2080bf268f8f15a96d8c255e32c024d4b2dc91bb8c2754bb483f442514e7f68e740acd4c6b6d92066cc352a2440c09345702e85e358aad02a6bc332c149f93a8')

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

