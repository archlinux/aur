# Maintainer: Immae <ismael.bouya@normalesup.org>

pkgname=patacrep
pkgver=5.1.2
pkgrel=1
pkgdesc="Engine for LaTeX songbooks"
arch=('any')
url="http://www.patacrep.com"
license=('GPL')
depends=('python' 'python-ply' 'python-jinja' 'python-chardet'
         'python-unidecode' 'texlive-fontsextra' 'texlive-latexextra'
         'python-argparse' 'lilypond')
makedepends=('python-setuptools')
source=("https://github.com/patacrep/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('1a734e775f3dca4419374fdd9283bd5eed6f8238bac96694e0354cbe4ac6c05f601f5f237a77cda9eed89b95148cbedb108cf810ca5e0fd4e7812408cbdac4f9')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python setup.py build
}

package(){
  cd "$srcdir/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
}

