# Maintainer: pobrn <pobrn at protonmail dot com>

_pkgname=git-of-theseus
pkgname=${_pkgname}-git
pkgver=0.2.0.r31.gc949a53
pkgrel=1
pkgdesc='Plot stats on Git repositories'
arch=('any')
url='https://github.com/erikbern/git-of-theseus'
depends=('python-gitpython'
         'python-numpy'
         'python-tqdm'
         'python-wcmatch'
         'python-pygments'
         'python-matplotlib')
makedepends=('git' 'python-setuptools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
license=('Apache')
source=("${_pkgname}::git+https://github.com/erikbern/git-of-theseus.git")
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"

    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_pkgname}"

    python setup.py build
}

package() {
    cd "${_pkgname}"

    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
