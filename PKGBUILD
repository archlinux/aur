# Maintainer: ellcs <me@ellcs.de>
pkgname=commix
pkgver=3.4
pkgrel=1
pkgdesc="Commix (short for [comm]and [i]njection e[x]ploiter) is an open source penetration testing tool that automates the detection and exploitation of command injection vulnerabilities."
arch=(x86_64 x86)
url="https://github.com/commixproject/commix"
license=('GPL3')
depends=(python)
makedepends=(python-build python-installer python-wheel)

source=(https://github.com/commixproject/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
noextract=()
md5sums=(31714b1aa7fe95527713bf45d7a7a20c) #generate with 'makepkg -g'

build() {
    python -m build --wheel --no-isolation "$pkgname-$pkgver"
}

package() {
    python -m installer --destdir="$pkgdir" "$pkgname-$pkgver"/dist/*.whl
}
