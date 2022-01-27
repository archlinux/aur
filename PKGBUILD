# Maintainer: Julian Maingot <sikmir@gmail.com>
# Contributor: Nikolay Korotkiy <sikmir@gmail.com>

pkgname=pyglossary
pkgver=4.4.1
pkgrel=1
pkgdesc="A tool for converting dictionary files aka glossaries with various formats for different dictionary applications"
arch=(any)
url="https://github.com/ilius/pyglossary"
license=('GPL3')
# TODO add python-libzim if/when it exists
depends=('python>=3.7.0')
optdepends=(
  'python-gobject: Gtk3-based interface'
  'tix: Tkinter-based interface'
  'python-prompt_toolkit: interactive command-line interface'
  'python-lxml: Many optional flags and formats'
  'python-beautifulsoup4: HTML parsing'
  'python-yaml: Reading from cc-kedict'
  'python-pyicu: Reading or writing Aard 2 (.slob) files'
  'python-marisa: Writing to Kobo E-Reader Dictionary'
  'python-lzo: Required for some MDX glossaries'
  'python-html5lib: Required to write to AppleDict'
)
makedepends=('python-setuptools')
provides=("${pkgname}=${pkgver}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ilius/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('269a04addc73cdca3c8cf32bcaa301f7507df23ba9ce34054ea00fd1341e9bea')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
  cp config.json $pkgdir/usr/share/pyglossary
}

install=pyglossary.install

# vim:set ts=2 sw=2 et:
