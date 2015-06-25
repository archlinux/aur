# Maintainer: Joël Porquet <joel@porquet.org>

pkgname=jpass-git
pkgver=r16.4d491bc
pkgrel=1
pkgdesc="JPass password manager"
url="https://joel.porquet.org/wiki/hacking/jpass/"
arch=('any')
license=('GPL3')
depends=('python' 'python-configobj')
makedepends=('git')

source=("${pkgname}::git+https://joel.porquet.org/cgit/cgit.cgi/jpass.git/")
md5sums=('SKIP')

pkgver() {
    cd ${pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${pkgname}

    python setup.py install --root="$pkgdir/" --optimize=1
}
