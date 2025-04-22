# Maintainer: Matthias Mailänder <matthias@mailaender.name>

pkgbase='python-lib50'
pkgname=('python-lib50')
_module='lib50'
pkgver='3.0.12'
pkgrel=2
pkgdesc="CS50's own internal library used in many of its tools."
url="https://github.com/cs50/lib50"
depends=('python' 'git' 'python-attrs' 'python-yaml' 'python-pexpect' 'python-requests' 'python-termcolor' )
makedepends=('python-build' 'python-installer' 'python-setuptools')
optdepends=('python-babel')
license=('GPLv3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('15ce076f501b49e7ad2b7807d7f7510947c718394ccdfce01757272b749ed355')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
