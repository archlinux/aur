pkgname=('i3ipc-python-git')
srcname='i3ipc-python'
pkgver='r1'
pkgrel='1'
pkgdesc='An improved Python library to control i3wm'
arch=('any')
url='https://github.com/acrisci/i3ipc-python'
license=('custom:BSD')

depends=('python' 'python-xlib')
makedepends=('git' 'python-setuptools')
provides=('i3ipc-python')
conflicts=('i3ipc-python')

source=("${srcname}::git+https://github.com/acrisci/i3ipc-python.git")
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
