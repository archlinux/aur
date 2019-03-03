# Maintainer:  JP-Ellis <josh@jpellis.me>
pkgname=papis
pkgver=0.8.2
pkgrel=1
pkgdesc="Papis is a powerful and highly extensible command-line based document and bibliography manager."
arch=('any')
url="https://github.com/papis/papis"
license=('GPL')
depends=('python'
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
sha256sums=('f248167cb84e7108616b2d84a3f807f5df0a80ed14856c349733711dfd93967f')
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
