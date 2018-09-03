# Maintainer:  JP-Ellis <josh@jpellis.me>
pkgname=papis
pkgver=0.7.1
pkgrel=1
pkgdesc="Papis is a powerful and highly extensible command-line based document and bibliography manager."
arch=('any')
url="https://github.com/papis/papis"
license=('GPL')
depends=('python'
         'python-argcomplete'
         'python-arxiv2bib'
         'python-beautifulsoup4'
         'python-bibtexparser'
         'python-future'
         'python-habanero'
         'python-magic-ahupp'
         'python-papis-python-rofi'
         'python-parse'
         'python-prompt_toolkit>=2.0.0'
         'python-pylibgen'
         'python-pyparser'
         'python-slugify'
         'python-unidecode'
         'python-urwid'
         'python-vobject'
        )
optdepends=()
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('fd99d085b4dc593b2631e26bfa90c2c9a2fef6a6b3363e4b60c9b0b7704dd28b')
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
