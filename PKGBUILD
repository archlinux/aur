# Maintainer:  JP-Ellis <josh@jpellis.me>
pkgname=papis
pkgver=0.7.5
pkgrel=2
pkgdesc="Papis is a powerful and highly extensible command-line based document and bibliography manager."
arch=('any')
url="https://github.com/papis/papis"
license=('GPL')
depends=('python'
         'python-argcomplete'
         'python-arxiv2bib'
         'python-beautifulsoup4'
         'python-bibtexparser'
         'python-chardet'
         'python-click'
         'python-future'
         'python-filetype'
         'python-habanero'
         'python-isbnlib'
         'python-prompt_toolkit>=2.0.0'
         'python-pylibgen'
         'python-pyparser'
         'python-pyparsing'
         'python-pyaml'
         'python-slugify'
         'python-requests'
        )
optdepends=('python-papis-rofi')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1a2a3f6673741f858d4ba41b64255e2fca33b17c5abb642608dbb4ee117d0ac4')
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
