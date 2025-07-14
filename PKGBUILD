# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: éclairevoyant
# Contributor: Michael A. Sinclair <squattingmonk at gmail dot com>
# Contributor: Dan Beste <drb at wishalloy dot com>

_pkgname=choosenim
pkgname=$_pkgname-bin
pkgver=0.8.16
pkgrel=1
pkgdesc='Installs different versions of Nim compiler and tools and switches between them (upstream binary)'
arch=(x86_64)
url="https://github.com/nim-lang/$_pkgname"
license=(BSD-3-Clause)
depends=(curl glibc)
optdepends=(
  'clang: C/C++ backend'
  'gcc: C/C++ backend'
)
provides=($_pkgname nim nimble nimgrep nimpretty nimsuggest)
conflicts=($_pkgname nim)
install=$pkgname.install
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname-${pkgver}_linux_amd64"
        "LICENSE-$pkgname-$pkgver::$url/raw/v$pkgver/LICENSE")
sha256sums=('1034e03564b3e5b5321646f9ce290cc4d3cdff0cf0e9b523d43f0db8b9a45c74'
            'b56edb0cb907c58a59146f73b43797be78a0e9e0a4d87905dadff9fa7f1d6494')

package() {
  install -vDm 755 $pkgname-$pkgver "$pkgdir"/usr/bin/$_pkgname
  install -vDm 644 LICENSE-$pkgname-$pkgver "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
