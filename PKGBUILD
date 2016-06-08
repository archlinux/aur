# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="synchost-git"
_pkgname="synchost"
pkgver=r14.b5e1f6d
pkgrel=1
pkgdesc="A command-line tool to keep an host synchronized"
url="https://github.com/StreakyCobra/synchost"
license=('MIT')
arch=('any')
depends=('git' 'python>=3.4' 'python-termcolor')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
changelog="ChangeLog"
source=("${_pkgname}::git+https://github.com/StreakyCobra/${_pkgname}.git#branch=develop")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}/"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}/"

    python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=4 sw=4 et:
