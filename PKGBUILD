# Maintainer: Immae <ismael.bouya@normalesup.org>

pkgname=patacrep
pkgver=4.0.0
pkgrel=1
pkgdesc="Engine for LaTeX songbooks"
arch=('any')
url="http://www.patacrep.com"
license=('GPL')
depends=('python' 'python-ply' 'python-jinja' 'python-chardet'
         'python-unidecode' 'texlive-fontsextra' 'lilypond')
makedepends=('python-setuptools')
source=("https://github.com/patacrep/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('76bcec90e3326ea152d500f35719509268ea5a26996800ea5118c7e924ea726b')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python setup.py build
}

package(){
  cd "$srcdir/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
}

