# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: éclairevoyant
# Contributor: Michael A. Sinclair <squattingmonk at gmail dot com>
# Contributor: Dan Beste <drb at wishalloy dot com>

_pkgname=choosenim
pkgname=$_pkgname-bin
pkgver=0.8.9
pkgrel=1
pkgdesc='Nim toolchain installer'
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
sha256sums=('c70975e1467b43842f7bcfd535b9d599ed359c7b61e26fab246b9e6fbab7bff6'
            '5cb6b77a8a0f2f60ed5b9ceeb633fc79331a012c209fc05617f47bc528724d87')

package() {
  install -vDm 755 $pkgname-$pkgver "$pkgdir"/usr/bin/$_pkgname
  install -vDm 644 LICENSE-$pkgname-$pkgver "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
