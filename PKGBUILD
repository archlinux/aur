# Maintainer: Popolon <popolon@popolon.org>

pkgbase='python-activitypub'
pkgname=('python-activitypub')
_module='activitypub'
pkgver='0.0.3'
pkgrel=1
pkgdesc="A general Python ActivityPub library"
url="https://github.com/dsblank/activitypub"
depends=('python')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('81f02761097fa9bacb8490a1a6f8cf61ae96bc100c74775046ea441082b69510')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
