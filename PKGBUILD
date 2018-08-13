# Maintainer:  JP-Ellis <josh@jpellis.me>
pkgname=papis
pkgver=0.6
pkgrel=1
pkgdesc="Papis is a powerful and highly extensible command-line based document and bibliography manager."
arch=('any')
url="https://github.com/papis/papis"
license=('GPL')
depends=('python'
         'python-argcomplete'
         'python-arxiv2bib'
         'python-parse'
         'python-beautifulsoup4'
         'python-bibtexparser'
         'python-habanero'
         'python-magic-ahupp'
         'python-papis-python-rofi'
         'python-pylibgen'
         'python-pyparser'
         'python-unidecode'
         'python-vobject'
        )
optdepends=()
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b21b3ff09198e01e3ca2e47279b252c8f5a5703ed009a5fc5b73deb58aed62d1')
noextract=()

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i '/configparser/d' setup.py
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
