# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase=('offlinemsmtp')
pkgname=('offlinemsmtp')
_module='offlinemsmtp'
pkgver='0.3.4'
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
source=('https://files.pythonhosted.org/packages/source/o/offlinemsmtp/offlinemsmtp-0.3.4.tar.gz')
sha256sums=('562be15243e8c79924396826a09d2bc59b738b018c69dd38df13c7af6ab140c6')
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
