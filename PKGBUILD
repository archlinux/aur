# Maintainer:  JP-Ellis <josh@jpellis.me>
pkgname=papis
pkgver=0.13
pkgrel=3
pkgdesc="Papis is a powerful and highly extensible command-line based document and bibliography manager."
arch=('any')
url="https://github.com/papis/papis"
license=('GPL')
depends=('python-pyaml'
         'python-arxiv2bib'
         'python-beautifulsoup4'
         'python-bibtexparser'
         'python-click'
         'python-colorama'
         'python-dominate'
         'python-filetype'
         'python-habanero'
         'python-isbnlib'
         'python-lxml'
         'python-platformdirs'
         'python-prompt_toolkit'
         'python-pygments'
         'python-pyparsing'
         'python-doi'
         'python-slugify'
         'python-requests'
         'python-stevedore'
        )
optdepends=(
  'papis-rofi: integration with rofi'
  'python-whoosh'
)
makedepends=(python-build python-installer python-wheel)

source=("https://github.com/papis/papis/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=("efff09aeaaacf170ef5c01170f1c856dbe09566096deb7ae649bfe755d58f225467241464e4b4bf8f36c25898fc7e9f689358073ab45e81d651defd127729af3")

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
