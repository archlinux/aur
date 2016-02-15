pkgname=('python-texttable-git')
srcname='python-texttable'
pkgver='r1'
pkgrel='1'
pkgdesc='For easy printing of ascii tables within Python'
arch=('any')
url='https://github.com/bufordtaylor/python-texttable'
license=('GPL2')

depends=('python')
makedepends=('git' 'python-setuptools')
provides=('python-texttable')
conflicts=('python-texttable')

source=("${srcname}::git+https://github.com/bufordtaylor/python-texttable.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${srcname}"

    printf 'r%s.%s.%s\n' \
        "$( git rev-list --count 'HEAD' )" \
        "$( git log --max-count='1' --pretty='format:%ct' )" \
        "$( git rev-parse --short 'HEAD' )"
}

package() {
    cd "${srcdir}/${srcname}"

    python setup.py install --root="${pkgdir}" --optimize=1
}
