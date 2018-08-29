# Maintainer:  JP-Ellis <josh@jpellis.me>
pkgname=papis
pkgver=0.7
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
         'python-prompt_toolkit'
         'python-pylibgen'
         'python-pyparser'
         'python-unidecode'
         'python-urwid'
         'python-vobject'
        )
optdepends=()
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e2853758d306dad1ad0ba4af5ab1ee0e0ef8613f1fa53a5a0e9f7a5e8f7ebc37')
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
