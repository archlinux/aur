# Maintainer:  kxxt <rsworktech at outlook dot com>
_name=tracexec
pkgname="$_name-bin"
pkgver=0.1.0
pkgrel=1
pkgdesc="A small utility for tracing execve{,at} and pre-exec behavior"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/kxxt/tracexec"
license=('GPL-2.0-or-later')
depends=('gcc-libs')
provides=('tracexec')
conflicts=('tracexec')
backup=()
options=()

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/kxxt/$_name/releases/download/v$pkgver/$_name-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/kxxt/$_name/releases/download/v$pkgver/$_name-aarch64-unknown-linux-gnu.tar.gz")
source_riscv64=("$pkgname-$pkgver-riscv64.tar.gz::https://github.com/kxxt/$_name/releases/download/v$pkgver/$_name-riscv64gc-unknown-linux-gnu.tar.gz")
noextract=()
b2sums_x86_64=('76031e7c12aa59903ac30a915d577f40060dccff963cac2a22c09ce22afa023d965ad268c14dfc32657a60dda8bd26c478df25511ded2a3974ee07e13ef8e837')
b2sums_aarch64=('87a6b6670664300aac9ca50b6f1d08072c603fa53d8b1236e9aa38938b50d456874fa1c60fffbe34ce20cea6f3b5b08e7ed6c4947d52d195d35bdfde283b262a')
b2sums_riscv64=('840d2da0a42f670b8f084716240586db4597e2dea47b2695d42c7773cacad122c3a752bc4ff4a78b84db404c89a331d901c0c0cfb8a0fe182296f7385002f0f5')


package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "$_name"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 THIRD_PARTY_LICENSES.HTML "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_LICENSES.HTML"
}
