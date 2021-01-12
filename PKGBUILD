# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='wgmgr'
pkgver=1.5.2
pkgrel=1
pkgdesc='Manages WireGuard PKIs for VPN-like deployments'
arch=('any')
url="https://github.com/coNQP/${pkgname}"
license=('GPLv3')
depends=('python' 'python-wgtools')
makedepends=('git' 'python-setuptools-scm')
source=("git+${url}.git#tag=${pkgver}")
md5sums=('SKIP')

build() {
    cd "${pkgname}"
    python setup.py build
}

package() {
    cd "${pkgname}"
    python setup.py install --root "${pkgdir}" --optimize=1 --skip-build
}
