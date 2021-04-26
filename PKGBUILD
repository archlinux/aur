pkgbase='python-better-profanity'
pkgname=('python-better-profanity')
_module='better_profanity'
pkgver='0.7.0'
pkgrel=1
pkgdesc="Blazingly fast cleaning swear words (and their leetspeak) in strings"
url="https://github.com/snguyenthanh/better_profanity"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('8a6fdc8606d7471e7b5f6801917eca98ec211098262e82f62da4f5de3a73145b')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
