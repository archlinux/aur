# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase=('offlinemsmtp')
pkgname=('offlinemsmtp')
_module='offlinemsmtp'
pkgver='0.3.2'
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
source=('https://files.pythonhosted.org/packages/source/o/offlinemsmtp/offlinemsmtp-0.3.2.tar.gz')
sha256sums=('ed113ee247f08dcfaf58c73e282c6a9d5fb68036fa182cc9cdb3fa3936c0b32b')
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
