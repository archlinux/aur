# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='dynwg'
pkgver=1.1.3
pkgrel=1
pkgdesc='A DynDNS watchdog for WireGuard over systemd-networkd'
arch=('any')
url="https://github.com/coNQP/${pkgname}"
license=('GPLv3')
depends=('python' 'python-setuptools' 'wireguard-tools' 'iputils')
makedepends=('git' 'python-setuptools-scm')
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${pkgname}"
    python setup.py build
}

package() {
    cd "${pkgname}"
    python setup.py install --root "${pkgdir}" --optimize=1 --skip-build
}
