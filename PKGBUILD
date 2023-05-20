# Maintainer:  JP-Ellis <josh@jpellis.me>
pkgname=papis
pkgver=0.13
pkgrel=1
pkgdesc="Papis is a powerful and highly extensible command-line based document and bibliography manager."
arch=('any')
url="https://github.com/papis/papis"
license=('GPL')
depends=('python'
         'python-pyaml'
         'python-arxiv2bib'
         'python-beautifulsoup4'
         'python-bibtexparser'
         'python-chardet'
         'python-click'
         'python-colorama'
         'python-dominate'
         'python-filetype'
         'python-habanero'
         'python-isbnlib'
         'python-lxml'
         'python-prompt_toolkit'
         'python-pygments'
         'python-pyparsing'
         'python-doi'
         'python-slugify'
         'python-requests'
         'python-stevedore'
         'python-tqdm'
         'python-typing_extensions'
        )
optdepends=(
  'papis-rofi: integration with rofi'
  'python-whoosh'
)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f35a6aa938361bb67c5b77d916ac8cec587638ad7d86dc87a917ac608ec965a7')
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
