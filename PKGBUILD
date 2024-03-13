# Maintainer: éclairevoyant
# Contributor: Wenxuan Zhang <wenxuangm at gmail dot com>

_pkgname=csview
pkgname="$_pkgname-bin"
pkgver=1.2.4
pkgrel=1
pkgdesc='High performance CSV viewer with CJK/emoji support'
arch=(i686 x86_64)
url="https://github.com/wfxr/$_pkgname"
license=(Apache MIT)
depends=(glibc gcc-libs)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$url/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('623383158409577e638e38b742b68051d584b6aeed9dc30ec497293e4c8f31e7')

package() {
	cd $_pkgname-v$pkgver-x86_64-unknown-linux-gnu

	install -Dm755 $_pkgname                       -t "$pkgdir/usr/bin/"
	install -Dm644 completions/fish/$_pkgname.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
	install -Dm644 completions/zsh/_$_pkgname      -t "$pkgdir/usr/share/zsh/site-functions/"
	install -Dm644 README.md                       -t "$pkgdir/usr/share/doc/$_pkgname/"
	install -Dm644 LICENSE-{APACHE,MIT}            -t "$pkgdir/usr/share/licenses/$pkgname/"
}
