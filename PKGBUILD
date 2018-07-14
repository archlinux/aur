# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase=('offlinemsmtp')
pkgname=('offlinemsmtp')
_module='offlinemsmtp'
pkgver='0.3.1'
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
source=('https://files.pythonhosted.org/packages/source/o/offlinemsmtp/offlinemsmtp-0.3.1.tar.gz')
sha256sums=('28c7b8a58813e56be9b5e60c4d86a296c94f3a17f9546fd081f165377e91743d')
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
