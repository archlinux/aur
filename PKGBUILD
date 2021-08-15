# Maintainer: Bet4 <0xbet4@gmail.com>

# Contributer: mcol <mcol at posteo dot net>

_pkgname=gita
pkgname=${_pkgname}-git
pkgver=0.15.2.r1.gee9b2f7
pkgrel=1
pkgdesc="Manage many git repos with sanity 从容管理多个git库"
url="https://github.com/nosarthur/gita"
arch=('any')
license=('MIT')
source=("git+${url}.git")
depends=('python-yaml')
makedepends=('git' 'python-setuptools')

sha256sums=('SKIP')
provides=(${_pkgname})

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
