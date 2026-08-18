# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: motte <ettom22 at hotmail dot com>
# Contributor: Wei-Ning Huang <aitjcize@gmail.com>

pkgname=cppman
pkgver=0.6.3
pkgrel=1
pkgdesc="C++ 98/11/14/17/20 manual pages for Linux, with source from cplusplus.com and cppreference.com."
arch=('any')
url="https://github.com/aitjcize/cppman"
license=('GPL3')
conflicts=(cppman-git)
depends=(python python-beautifulsoup4 python-html5lib)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=("vim: For using vim as a pager"
            "perl: for bash/zsh completion")
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('4335e20b995cb215a776b0f52a8027064b0cb79d03480e5d0e1bf96199560e255ec569de5636206ea96e4b86ac3dd6c89056393fef87f515d86f6e496932c75b')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
