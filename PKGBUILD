# Maintainer: Rafael Ascensão <rafa dot almas at gmail dot com>
# Contributor: Magnus Therning <magnus@therning.org>

pkgname=git-imerge-git
_pkgname=git-imerge
pkgver=1.1.0.r20.g9d51192
pkgrel=1
pkgdesc='Incremental merge for git'
arch=('any')
url='https://github.com/mhagger/git-imerge'
license=('GPL2')
depends=('python' 'git')
makedepends=('python-setuptools' 'bash-completion')
changelog=${pkgname}.changelog
source=('git+https://github.com/mhagger/git-imerge.git')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long | sed -r 's/^v//; s/([^-]*-g)/r\1/; s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
