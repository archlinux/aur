# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: motte <ettom22 at hotmail dot com>
# Contributor: Wei-Ning Huang <aitjcize@gmail.com>

_name=cppman
pkgname=python-$_name
pkgver=0.5.4
pkgrel=1
pkgdesc="C++ 98/11/14/17/20 manual pages for Linux, with source from cplusplus.com and cppreference.com."
arch=('any')
url="https://github.com/aitjcize/cppman"
license=('GPL3')
conflicts=(cppman-git)
depends=(python python-beautifulsoup4 python-html5lib)
optdepends=("vim: For using vim as a pager"
            "perl: for bash/zsh completion")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('6a2b072db7104378e22f3f3f4909ca2315b563f26ec88d2a81bdd176597a111b0320e9f80dbbe75c8f6ec01b7170c23fa081c6bd7147a09cff40fe481cf9c60d')

build() {
    cd $_name-$pkgver
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root=${pkgdir}/ --optimize=1
}
