# Maintainer: pavel.finkelshtein@gmail.com <asm0dey>
pkgname=mergestat-bin
pkgver=0.6.2
pkgrel=1
epoch=
pkgdesc="Query git repositories with SQL. Generate reports, perform status checks, analyze codebases."
arch=("x86_64")
url="https://github.com/mergestat/mergestat-lite"
license=("MIT")
groups=()
depends=("pcre" "openssl")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=(askgit-bin)
replaces=()
backup=()
options=()
install=
changelog=
source=("mergestat-$pkgver.tar.gz::https://github.com/mergestat/mergestat-lite/releases/download/v$pkgver/mergestat-linux-amd64.tar.gz"
	"https://raw.githubusercontent.com/mergestat/mergestat/main/LICENSE")
sha256sums=('bfad589440c939760b7da3474d027e6d786c80d4592ce1bbcea4bc722e64d139'
	'21c4613291ed2cf8965a0616d62ac36bed429733590f1d920e14a48326bf5933')
noextract=()
validpgpkeys=()

package() {
	install -Dm 755 "$srcdir/mergestat" "$pkgdir/usr/bin/mergestat"
	mkdir -p "$pkgdir/usr/lib"
	ln -s /usr/lib/libpcre.so "$pkgdir"/usr/lib/libpcre.so.3
	install -Dm 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/mergestat-bin/LICENSE"

}
