# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Hugo Doria <hugodoria at gmail.com>

pkgname=translate-toolkit
pkgver=3.3.1
pkgrel=1
pkgdesc="A toolkit to convert between various different translation formats, help process and validate localisations"
arch=('any')
url="https://toolkit.translatehouse.org/"
license=('GPL')
depends=('bash' 'python-lxml' 'python-six' 'python-diff-match-patch')
makedepends=('python-setuptools')
optdepends=('gaupol: for po2sub'
            'python-chardet: encoding detector'
            'python-levenshtein: faster matching'
            'python-cheroot: for TM Server')
source=($pkgname-$pkgver.tar.gz::https://github.com/translate/translate/archive/$pkgver.tar.gz)
sha256sums=('2e8fc2ed6cf9da66bd742a5c007574b31adefbda69d52559526da6b6219bb5ad')

package() {
  cd "${srcdir}"/translate-$pkgver

  python -s setup.py install --root="${pkgdir}" --optimize=1
  python -m compileall "${pkgdir}"/usr/lib/python3.9/site-packages/translate
}
