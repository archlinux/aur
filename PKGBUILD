# Maintainer: Joël Porquet <joel@porquet.org>

pkgname=jinstall-git
pkgver=r24.df74938
pkgrel=1
pkgdesc="Terminal-based automated file installer"
url="https://github.com/joel-porquet/jinstall/"
arch=('any')
license=('GPL3')
depends=('python' 'python-urwid')
makedepends=('git')

source=("${pkgname}::git+https://github.com/joel-porquet/jinstall/")
md5sums=('SKIP')

pkgver() {
    cd ${pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${pkgname}

    python setup.py install --root="$pkgdir/" --optimize=1
}
