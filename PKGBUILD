# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

_tag=v0.5.9-beta
pkgbase=${pkgname}
pkgname=python-x3dh
pkgver=0.5.9.beta
pkgrel=2
pkgdesc="A python implementation of the Extended Triple Diffie-Hellman key agreement protocol"
url="https://github.com/Syndace/${pkgname}"
license=('MIT')
arch=('any')
makedepends=('git' 'python-setuptools')
source=("${pkgname}::git+https://github.com/Syndace/${pkgname}.git#tag=${_tag}")
sha256sums=('SKIP')
depends=('python-xeddsa')

pkgver() {
    cd ${pkgname}
    printf "%s" "$(git describe --tags | sed -e 's/^v//;s/-/./')"
}

build() {
    cd ${pkgname}
    python3 setup.py build
}

package() {
    cd ${pkgname}
    python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
