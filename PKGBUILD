# Maintainer: TwoFinger
# Contributor: Cooper Pierce <cppierce@andrew.cmu.edu>
pkgname=smlfmt
pkgver=1.2.0
pkgrel=1
pkgdesc='An auto-formatter for Standard ML'
url='https://github.com/shwestrick/smlfmt'
arch=(x86_64)
license=(MIT)
makedepends=(mlton)
source=($pkgname-$pkgver.tgz::$url/archive/refs/tags/v$pkgver.tar.gz)
md5sums=(9502dec54c0047a1c831b461477201d8)

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 smlfmt "$pkgdir"/usr/bin/smlfmt
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

check() {
    cd "$pkgname-$pkgver"
    # Test case runner relies on finding the git root
    git init
    cd test
    ./runall
}
