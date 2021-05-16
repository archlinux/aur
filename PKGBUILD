# Maintainer: Shakil Shaikh <sshaikh@hotmail.com>

pkgbase='python-london-unified-prayer-times'
pkgname=('python-london-unified-prayer-times')
_module='london_unified_prayer_times'
pkgver='1.2.1'
pkgrel=2
pkgdesc="A library for retrieving data from The London Unified Prayer Timetable."
url="https://github.com/sshaikh/london_unified_prayer_times"
depends=('python' 'python-click' 'python-click-default-group' 'python-jsonschema'
'python-dateutil' 'python-appdirs' 'python-tzlocal' 'python-humanize' 'python-beautifulsoup4')
makedepends=('python-setuptools' 'python-pip')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('c011cd916d014865617e51eddc424393f33e73d2a97090646b7a9be6c0558b62')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
