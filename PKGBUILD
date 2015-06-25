# Maintainer: Joël Porquet <joel@porquet.org>

pkgname=jinstall-git
pkgver=r7.eaaebaf
pkgrel=1
pkgdesc="Automated file installer"
url="https://joel.porquet.org/wiki/hacking/jinstall/"
arch=('any')
license=('GPL3')
depends=('python' 'pdmenu')
makedepends=('git')

source=("${pkgname}::git+https://joel.porquet.org/cgit/cgit.cgi/jinstall.git/")
md5sums=('SKIP')

pkgver() {
    cd ${pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${pkgname}

    python setup.py install --root="$pkgdir/"
}
