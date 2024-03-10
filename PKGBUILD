# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: motte <ettom22 at hotmail dot com>
# Contributor: Wei-Ning Huang <aitjcize@gmail.com>

pkgname=cppman
pkgver=0.5.6
pkgrel=3
pkgdesc="C++ 98/11/14/17/20 manual pages for Linux, with source from cplusplus.com and cppreference.com."
arch=('any')
url="https://github.com/aitjcize/cppman"
license=('GPL3')
conflicts=(cppman-git)
depends=(python python-beautifulsoup4 python-html5lib)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=("vim: For using vim as a pager"
            "perl: for bash/zsh completion")
source=("$url/archive/$pkgver.tar.gz")
b2sums=('ca4c3bc05e3f8b7de432147dcff861ab4b1d3b3de2729da2dc4cb8513f96b3b92e9a7ebbbf0ad577d7372ebc7d152290431d4d95127c63a1a9122c2dd5f12aae')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
