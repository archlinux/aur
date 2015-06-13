pkgname=('python-dockerpty-git')
srcname='dockerpty'
pkgver='r1'
pkgrel='1'
pkgdesc='Pseudo-tty handler for docker Python client'
arch=('any')
url='https://github.com/d11wtq/dockerpty'
license=('Apache')

depends=('python' 'python-six')
makedepends=('git' 'python-setuptools')
provides=('python-dockerpty')
conflicts=('python-dockerpty')

source=("${srcname}::git+https://github.com/d11wtq/dockerpty.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${srcname}"

    printf 'r%s.%s\n' \
        "$( git rev-list HEAD | wc --lines )" \
        "$( git describe --always | sed 's/-/./g' )"
}

package() {
    cd "${srcdir}/${srcname}"

    python setup.py install --root="${pkgdir}" --optimize=1
}
