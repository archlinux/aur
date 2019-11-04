# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Hugo Doria <hugodoria at gmail.com>

pkgname=translate-toolkit
pkgver=2.4.0
pkgrel=2
pkgdesc="A toolkit to convert between various different translation formats, help process and validate localisations"
arch=('any')
url="https://toolkit.translatehouse.org/"
license=('GPL')
depends=('bash' 'python-lxml' 'python-six' 'python-diff-match-patch')
makedepends=('python-setuptools')
optdepends=('gaupol: for po2sub'
            'python-chardet: encoding detector'
            'python-levenshtein: faster matching')
source=($pkgname-$pkgver.tar.gz::https://github.com/translate/translate/archive/$pkgver.tar.gz)
sha256sums=('7f1d6a9566bb512fd88d51bd8bc920f42e379c91a4686761dbe89762f8a3a51d')

package() {
  cd "${srcdir}"/translate-$pkgver

  python -s setup.py install --root="${pkgdir}" --optimize=1
  python -m compileall "${pkgdir}"/usr/lib/python3.8/site-packages/translate
}
