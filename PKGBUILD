# Maintainer: Matthias Mailänder <matthias@mailaender.name>

pkgbase='python-check50'
pkgname=('python-check50')
_module='check50'
pkgver='3.4.0'
pkgrel=1
pkgdesc="Command-line program with which you can check the correctness of your programs in the CS50 courses."
url="https://github.com/cs50/check50"
depends=('git' 'python' 'python-attrs' 'python-beautifulsoup4' 'python-lib50' 'python-pexpect' 'python-requests' 'python-termcolor' 'python-jinja' 'python-jellyfish' 'python-yaml' 'python-cryptography')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-packaging')
optdepends=('python-babel')
license=('GPLv3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('8a17a3ce74c1cdb0cefd43ad1f55ca488ce2c62f71998886209a757f094be89a')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
