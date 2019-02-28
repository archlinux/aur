# Maintainer:  JP-Ellis <josh@jpellis.me>
pkgname=papis
pkgver=0.8.1
pkgrel=1
pkgdesc="Papis is a powerful and highly extensible command-line based document and bibliography manager."
arch=('any')
url="https://github.com/papis/papis"
license=('GPL')
depends=('python'
         # 'python-argcomplete'
         'python-arxiv2bib'
         'python-beautifulsoup4'
         'python-bibtexparser'
         'python-chardet'
         'python-click'
         'python-colorama'
         'python-filetype'
         'python-habanero'
         'python-isbnlib'
         'python-prompt_toolkit'
         'python-pylibgen'
         'python-pyparsing'
         'python-pygments'
         'python-pyaml'
         'python-slugify'
         'python-requests'
        )
optdepends=('python-papis-rofi: integration with rofi')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1afc46ef29ce797ccb57ccadc6384a9e5d324bb650189f04dccf3eadad79cf7b')
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
