# Maintainer: Joël Porquet <joel@porquet.org>

pkgname=jinstall-git
pkgver=r7.eaaebaf
pkgrel=1
pkgdesc="Terminal-based automated file installer"
url="https://joel.porquet.org/wiki/hacking/jinstall/"
arch=('any')
license=('GPL3')
depends=('python' 'python-urwid')
makedepends=('git' 'python-setuptools')

source=("${pkgname}::git+https://joel.porquet.org/cgit/cgit.cgi/jinstall.git/")
md5sums=('SKIP')

pkgver() {
    cd ${pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${pkgname}

    ./setup.py install --root="$pkgdir/"
}
