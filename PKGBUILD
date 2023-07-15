# Maintainer: éclairevoyant
# Contributor: Michael A. Sinclair <squattingmonk at gmail dot com>
# Contributor: Dan Beste <drb at wishalloy dot com>

_pkgname=choosenim
pkgname="$_pkgname-bin"
pkgver=0.8.4
pkgrel=2
pkgdesc='Nim toolchain installer'
arch=(x86_64)
url="https://github.com/dom96/$_pkgname"
license=(BSD)
depends=(glibc)
optdepends=('clang: C/C++ backend'
            'gcc: C/C++ backend')
provides=("$_pkgname=$pkgver" nim nimble nimgrep nimpretty nimsuggest)
conflicts=("$_pkgname" nim nimble nimgrep nimpretty nimsuggest)
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname-${pkgver}_linux_amd64"
        "$pkgname-$pkgver.LICENSE::$url/raw/v$pkgver/LICENSE")
b2sums=('4190f29eec3f28a9161a229e4466858c997abd6a15e6e01d83e51c4a8ae327d5bbbffd5b465ee1ba9f095609fa0245900caa4bbb46b041b0f5f334e4e8edaa7d'
        '8f19a2a567b2415263d72a13cd1508a1ba189e211a91580bf78653185717df5c7582e09ef27f60176eba3dbdb379d0f64fccc595a5970d40bc381f62a72cad00')

package() {
	install -vDm755 $pkgname-$pkgver "$pkgdir/usr/bin/$_pkgname"
	install -vDm644 $pkgname-$pkgver.LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
