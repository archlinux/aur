# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: motte <ettom22 at hotmail dot com>
# Contributor: Wei-Ning Huang <aitjcize@gmail.com>

pkgname=cppman
pkgver=0.5.6
pkgrel=1
pkgdesc="C++ 98/11/14/17/20 manual pages for Linux, with source from cplusplus.com and cppreference.com."
arch=('any')
url="https://github.com/aitjcize/cppman"
license=('GPL3')
conflicts=(cppman-git)
depends=(python python-beautifulsoup4 python-html5lib)
optdepends=("vim: For using vim as a pager"
            "perl: for bash/zsh completion")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
b2sums=('0221f1a444f91e5e2db44be6d1be4ea3d1521fc043a661cb6a1ab79f0c4eeba970e0f8d77aaa88f7d622a719a671f44b935cededfaff445f0363f2006e49cdb1')

build() {
    cd $pkgname-$pkgver
    python setup.py build
}

package() {
    cd $pkgname-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1
}
