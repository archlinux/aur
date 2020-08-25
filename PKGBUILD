# Maintainer: Alexander Bruegmann <mail[at]abruegmann[dot]eu>
pkgbase='python-restfly'
pkgname=('python-restfly')
_module='restfly'
pkgver='1.3.5'
pkgrel=1
pkgdesc="A library to make API wrappers creation easier"
url="https://github.com/stevemcgrath/restfly"
depends=('python' 'python-box' 'python-requests')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha512sums=('d39f08a4f13ecb49a662e21b094b0b164eb57f93377dc953e2fabd80e33ace3bf898a3e9529733976f9095ef58d14bfe099d8052d9abf43e7f0b61175a214e4f')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
