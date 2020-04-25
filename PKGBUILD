# Maintainer: Nicolas KAROLAK <nicolas at karolak dot fr>
pkgname=devc
pkgver=0.4.1
pkgrel=3
pkgdesc="A CLI tool to manage your devcontainers using docker-compose"
arch=('x86_64')
url="https://git.karolak.fr/nicolas/devc"
license=('GPL3')
depends=('podman-compose')
makedepends=(
	'make'
	'go'
)
source=("$pkgname-$pkgver.tar.gz::https://git.karolak.fr/nicolas/$pkgname/archive/v$pkgver.tar.gz")
#validpgpkeys=('722F069CE8337170B4A2B30370D56B0C9C0FCF6B')
md5sums=('e50a360f6bd820300baf184ef66b5c07')
sha256sums=('ae78ee92ef4bdac31c309ad8af995ac386490df6c8ba0b1f4ea9d1993548bb2b')
sha512sums=('df1edb7e69564c04796e8a064eab892f02af346d796a6bb263cb2191d523879165957c1768c839c9dbfdf758cef5e8638228ef11403a9a4d62b0f71f20f0dd55')

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
