# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgbase='python-aim-ui'
pkgname=('python-aim-ui')
_module='aim-ui'
pkgver='3.16.0'
pkgrel=1
pkgdesc="Aim UI"
url=""
depends=('python')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('764e1ba572ad9e3c35394cfe84b99dc4a59d3ed1e4596d90259acec4b24006fa')

build() {
    cd "${srcdir}/${_module}-${pkgver}" || exit 1
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}" || exit 1
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
