# Maintainer: Miodrag Tokić

pkgname=watson
pkgver=1.3.2
pkgrel=1
pkgdesc='A wonderful CLI to track your time!'
arch=('any')
url='https://tailordev.github.io/Watson/'
license=('MIT')
depends=('python' 'python-arrow' 'python-click' 'python-requests')
makedepends=('python-setuptools')
options=(!emptydirs)

source=("https://github.com/TailorDev/Watson/archive/${pkgver}.tar.gz")
sha256sums=('4b0a0083349447ecb72e0d1579755a955025daa564965397c78c6c3b2533f8fe')

build() {
    cd "$srcdir/Watson-${pkgver}"

    python setup.py build
}

package() {
    cd "$srcdir/Watson-${pkgver}"

    install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m 644 watson.completion "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
