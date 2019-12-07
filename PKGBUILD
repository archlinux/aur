# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase='offlinemsmtp'
pkgname=('offlinemsmtp')
_module='offlinemsmtp'
pkgver='0.3.5'
pkgrel=1
pkgdesc='msmtp wrapper allowing for offline use'
url='https://gitlab.com/sumner/offlinemsmtp'
depends=(
    'python'
    'python-watchdog'
    'python-gobject'
)
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=('https://files.pythonhosted.org/packages/source/o/offlinemsmtp/offlinemsmtp-0.3.5.tar.gz')
sha256sums=('5f680b8dc418b49a115b1cf2a48515c06575e8c4b46c68300b90cc712994bbc1')
replaces=('python-offlinemsmtp')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
