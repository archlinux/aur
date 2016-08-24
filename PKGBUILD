pkgname=('python-pyuserinput-git')
_srcname='PyUserInput'
pkgdesc='A module for cross-platform control of the mouse and keyboard in python that is simple to install and use'
pkgver='r1'
pkgrel='1'
arch=('any')
url="https://github.com/SavinaRoja/${_srcname}"
license=('GPL3')

depends=('python' 'python-xlib')
makedepends=('git' 'python-setuptools')
provides=('pyuserinput')
conflicts=('pyuserinput')

source=("${_srcname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_srcname}"

    printf 'r%s.%s.%s\n' \
        "$( git rev-list --count 'HEAD' )" \
        "$( git log --max-count='1' --pretty='format:%ct' )" \
        "$( git rev-parse --short 'HEAD' )"
}

package() {
    cd "${srcdir}/${_srcname}"

    python setup.py install --root="${pkgdir}" --optimize=1
}
