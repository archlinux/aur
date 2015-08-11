# Maintainer: Carmen Bianca Bakker <carmenbbakker@gmail.com>
pkgname=python-appdirs-git
pkgver=1.4.1.r141.c3f3545
pkgrel=2
pkgdesc='A small Python module for determining appropriate platform-specific dirs, e.g. a "user data dir".'
arch=('any')
url='https://github.com/ActiveState/appdirs'
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'git')
provides=("python-appdirs=$pkgver")
conflicts=('python-appdirs')
source=('appdirs::git+https://github.com/ActiveState/appdirs.git')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/appdirs"
    printf "%s.r%s.%s" "$(python setup.py --version)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/appdirs"
    python setup.py install --root="${pkgdir}/"
}
