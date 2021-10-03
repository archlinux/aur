# Maintainer: pavel.finkelshtein@gmail.com <asm0dey>
pkgname=askgit-bin
pkgver=0.4.7
pkgrel=1
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
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("askgit-$pkgver.tar.gz::https://github.com/askgitdev/askgit/releases/download/v$pkgver/askgit-linux-amd64.tar.gz"
	"https://raw.githubusercontent.com/askgitdev/askgit/main/LICENSE")
sha256sums=('b2427ad27ebce4857f46477908d26ca89384990d65321a8cc6a4da2b6f250f53'
	'526fbd13526ae2cc7eade7fc3360c8675f1ce31225fd4057b031f9ff2cfc6434')
noextract=()
validpgpkeys=()

package() {
	install -Dm 755 "$srcdir/askgit" "$pkgdir/usr/bin/askgit"
	mkdir -p "$pkgdir/usr/lib"
	ln -s /usr/lib/libpcre.so "$pkgdir"/usr/lib/libpcre.so.3
    install -Dm 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/askgit-bin/LICENSE"

}
