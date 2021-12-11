# Maintainer: pavel.finkelshtein@gmail.com <asm0dey>
pkgname=askgit-bin
pkgver=0.5.0
pkgrel=2
epoch=
pkgdesc="Query git repositories with SQL. Generate reports, perform status checks, analyze codebases."
arch=("x86_64")
url="https://github.com/askgitdev/askgit"
license=("MIT")
groups=()
depends=("pcre" "openssl")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=(mergestat-bin)
replaces=()
backup=()
options=()
install=
changelog=
source=("askgit-$pkgver.tar.gz::https://github.com/mergestat/mergestat/releases/download/v$pkgver/mergestat-linux-amd64.tar.gz"
	"https://raw.githubusercontent.com/mergestat/mergestat/main/LICENSE")
sha256sums=('18bbd785265e25bae895a600746db574950da953d72b60f63826ca41b0056c12'
'526fbd13526ae2cc7eade7fc3360c8675f1ce31225fd4057b031f9ff2cfc6434')
noextract=()
validpgpkeys=()

package() {
	install -Dm 755 "$srcdir/mergestat" "$pkgdir/usr/bin/mergestat"
	mkdir -p "$pkgdir/usr/lib"
	ln -s /usr/lib/libpcre.so "$pkgdir"/usr/lib/libpcre.so.3
    ln -s /usr/bin/mergestat "$pkgdir/usr/bin/askgit"
    install -Dm 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/askgit-bin/LICENSE"

}
