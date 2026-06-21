# Maintainer: ZXY595 <zxy_595@qq.com>
_pkgname=clashtui
pkgname=$_pkgname-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Mihomo (Clash.Meta) TUI Client"
arch=('x86_64')
url="https://github.com/JohanChane/clashtui"
license=('MIT')
depends=("mihomo" "sudo" "fzf")
optdepends=()
conflicts=("$_pkgname")
install="post.install"
source=(
	"$url/releases/download/v$pkgver/$_pkgname-linux-amd64-v$pkgver.gz"
	"config.yaml"
)
sha256sums=(
	'4d4cf18563794ed9e0220bb843f5ca0ee3d81b008dd4d9cd2dff65082fa4735b'
	"SKIP"
)

package() {
	install -Dm 755 "$_pkgname-linux-amd64-v$pkgver" "$pkgdir/usr/bin/$_pkgname"
	install -Dm 644 "config.yaml" -t "$pkgdir/usr/share/$_pkgname/"
}

