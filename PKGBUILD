# Maintainer: malwareslayer <alternate-egoist@protonmail.com>

pkgname=mbuild
pkgver=2022.07.28
pkgrel=1
pkgdesc="Python-based build system used for building XED"
arch=('any')
url='https://intelxed.github.io/'
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/intelxed/mbuild/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d3a2a514cec936036fd203a3ecdb8b60e07fc6ee20670edeb0bc14b1f9a9a51d')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install \
        --prefix=/usr \
        --root="$pkgdir" \
        --optimize=1 \
        --skip-build
}

# vim: set ts=4 sw=4 et :
