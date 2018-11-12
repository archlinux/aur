# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase=('offlinemsmtp')
pkgname=('offlinemsmtp')
_module='offlinemsmtp'
pkgver='0.3.3'
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
source=('https://files.pythonhosted.org/packages/source/o/offlinemsmtp/offlinemsmtp-0.3.3.tar.gz')
sha256sums=('230d2866b661c3aea21e97da97ba4b7f871e38bd09f22ae3507e4af06bd75773')
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
