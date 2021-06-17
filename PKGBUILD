# Maintainer: Shakil Shaikh <sshaikh@hotmail.com>

pkgbase='python-london-unified-prayer-times'
pkgname=('python-london-unified-prayer-times')
_module='london_unified_prayer_times'
pkgver='1.2.6'
pkgrel=1
pkgdesc="A library for retrieving data from The London Unified Prayer Timetable."
url="https://github.com/sshaikh/london_unified_prayer_times"
depends=('python' 'python-click' 'python-click-default-group' 'python-jsonschema'
'python-dateutil' 'python-appdirs' 'python-tzlocal' 'python-humanize' 'python-beautifulsoup4')
makedepends=('python-setuptools' 'python-pip')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('2065e7fd8ae3ab087af1c5154ff840ac6d4de04cd4aa2e4516e416d5374982f8')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
