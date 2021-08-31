# Maintainer: Esteban López Rodríguez <gnu_stallman at protonmail dot ch>
# Contributor: OctopusET
pkgname=norminette
pkgver=3.3.32
pkgrel=1
pkgdesc="Open source norminette"
arch=('any')
url='https://github.com/42School/norminette'
license=('MIT')
conflicts=('norminette-git')
depends=('python-argparse')
makedepends=('git' 'python-setuptools')
source=("$pkgver.tar.gz"::"https://github.com/42School/norminette/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('6e033948b86342845f4a63d0308d950128fce5630c55074197e8dc140e8061c9a580f965d396652c908d422f770cf0620fa38c63e7b5d41b47dacf490bc9c5dd')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
