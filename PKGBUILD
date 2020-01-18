# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: 71e6fd52 <DAStudio.71e6fd52@gmail.com>

pkgbase='python-genpac'
pkgname='python-genpac'
_module='genpac'
pkgver='2.0.1'
pkgrel=1
pkgdesc="convert gfwlist to pac, custom rules supported."
url="https://github.com/JinnLynn/genpac"
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=(https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz)
md5sums=('8a653ac6d3f540eff4308ad7288e5819')


build() {
    cd "${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends=('python')

    cd "${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
