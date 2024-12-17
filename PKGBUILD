# Maintainer: Matthias Mailänder <matthias@mailaender.name>

pkgbase='python-check50'
pkgname=('python-check50')
_module='check50'
pkgver='3.3.11'
pkgrel=3
pkgdesc="Command-line program with which you can check the correctness of your programs in the CS50 courses."
url="https://github.com/cs50/check50"
depends=('git' 'python' 'python-attrs' 'python-beautifulsoup4' 'python-lib50' 'python-pexpect' 'python-requests' 'python-termcolor' 'python-jinja' 'python-jellyfish' 'python-yaml' 'python-cryptography')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-packaging')
optdepends=('python-babel')
license=('GPLv3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('bfbdfa4758f29e2604cf1b5f4ab31713ef3ca9bd5dc6e647da2479a57967d71f')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
