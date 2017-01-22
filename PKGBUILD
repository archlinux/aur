# Maintainer: David McInnis <davidm@eagles.ewu.edu>

pkgname='python-django-storages'
_module='django-storages'
pkgver='1.5.2'
pkgrel=2
pkgdesc="Support for many storages (S3, Libcloud, etc) in Django."
url="https://github.com/jschneier/django-storages"
depends=('python' 'python-django')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/d/django-storages/django-storages-${pkgver}.tar.gz")
sha256sums=('60fe20cbf31eeda4e6065039646b6abecc45d6cc41246dd198c477031d848ffa')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
