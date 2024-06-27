# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: motte <ettom22 at hotmail dot com>
# Contributor: Wei-Ning Huang <aitjcize@gmail.com>

pkgname=cppman
pkgver=0.5.7
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
source=("$url/archive/$pkgver.tar.gz")
b2sums=('cde95de96c1e9c436b5f2372d1e681512163110ce713e799124821d436ff20ca9d1ab73d74d3d72136fba27a36ccf912f1c52a2433cbeded2f721d97b8896cc6')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
