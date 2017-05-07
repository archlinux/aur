# Maintainer: Sara Jakša <sarajaksa@gmail.com>

_pkgname=python2-pytumblr
pkgname=$_pkgname-git
pkgver=2
pkgrel=1
pkgdesc="Python2 wrapper for Tumblr API"
arch=('any')
url="https://github.com/tumblr/pytumblr"
license=('Apache')
depends=('python2' 'python2-oauth2')
makedepends=('python2-setuptools' 'git')
provides=($_pkgname)
conflicts=($_pkgname)
source=("pytumblr::git+https://github.com/tumblr/pytumblr")
sha256sums=('SKIP')


pkgver() {
    cd "${srcdir}/pytumblr"
    printf "%s.r%s.%s" "$(python setup.py --version)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/pytumblr"
    python2 setup.py install --root="${pkgdir}/"
}
