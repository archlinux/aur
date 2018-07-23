# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Hugo Doria <hugodoria at gmail.com>

pkgname=translate-toolkit
pkgver=2.3.0
pkgrel=2
pkgdesc="A toolkit to convert between various different translation formats, help process and validate localisations"
arch=('any')
url="http://toolkit.translatehouse.org/"
license=('GPL')
depends=('bash' 'python-lxml' 'python-six' 'python-diff-match-patch')
makedepends=('python-setuptools')
optdepends=('gaupol: for po2sub'
            'python-chardet: encoding detector'
            'python-levenshtein: faster matching')
source=(https://github.com/translate/translate/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('763325a419fdf2d5429e24bad42f33bccca7eb58279f57ddd742c4c3ea794ccb')

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  python -s setup.py install --root="${pkgdir}" --optimize=1
  python -m compileall "${pkgdir}"/usr/lib/python3.7/site-packages/translate
}
