# Maintainer:  JP-Ellis <josh@jpellis.me>
pkgname=papis
pkgver=0.12
pkgrel=1
pkgdesc="Papis is a powerful and highly extensible command-line based document and bibliography manager."
arch=('any')
url="https://github.com/papis/papis"
license=('GPL')
depends=('python'
         'python-requests'
         'python-filetype'
         'python-pyparsing'
         # 'python-configparser' This dependency from setup.py is part of the standard library in Python 3.10
         'python-arxiv2bib'
         'python-pyaml'
         'python-chardet'
         'python-beautifulsoup4'
         'python-colorama'
         'python-bibtexparser'
         'python-click'
         'python-habanero'
         'python-isbnlib'
         'python-prompt_toolkit'
         'python-tqdm'
         'python-pygments'
         'python-stevedore'
         'python-doi'
         'python-typing_extensions'
         'python-lxml'
         'python-slugify'
        )
optdepends=('papis-rofi: integration with rofi')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9005ff51ec27c2ebf542c9c6f2a987e77060c53dce12a57de8ce39afb3deb483')
noextract=()

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
}

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
