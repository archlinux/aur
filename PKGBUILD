# Maintainer: Nicolas KAROLAK <nicolas at karolak dot fr>
pkgname=devc
pkgver=0.4.1
pkgrel=1
pkgdesc="A CLI tool to manage your devcontainers using docker-compose"
arch=('x86_64')
url="https://git.karolak.fr/nicolas/devc"
license=('GPL3')
depends=('docker-compose')
makedepends=(
	'make'
	'go'
)
source=("$pkgname-$pkgver.tar.gz::https://git.karolak.fr/nicolas/$pkgname/archive/v$pkgver.tar.gz")
#validpgpkeys=('722F069CE8337170B4A2B30370D56B0C9C0FCF6B')
md5sums=('21cf060b8994498a7126057feda0cc02')
sha256sums=('764c22e6a01d586f25fabd1806f06d7c48f97f5c6ea6ad8b9e8389f8f46a3854')
sha512sums=('404f30b2b3a337f944f36d3b289cb89c6fbe15bbb157fc8bceb83aad5f067a78d443d08145c27354143fed026d7b70e6cbb7ef2f90ec614a1de1b2ddb3adfc90')

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
