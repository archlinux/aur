pkgname=('python-pyuserinput-git')
srcname='pyuserinput'
pkgdesc='A module for cross-platform control of the mouse and keyboard in python that is simple to install and use'
pkgver='r1'
pkgrel='1'
arch=('any')
url='https://github.com/SavinaRoja/PyUserInput'
license=('GPL3')

depends=('python' 'python-xlib')
makedepends=('git' 'python-setuptools')
provides=('pyuserinput')
conflicts=('pyuserinput')

source=("${srcname}::git+https://github.com/SavinaRoja/PyUserInput.git")
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
