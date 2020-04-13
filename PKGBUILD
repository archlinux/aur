# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: tahayassen
pkgname=uberwriter
pkgver=2.1.5a
pkgrel=1
pkgdesc="A distraction free Markdown editor for GNU/Linux made with GTK+"
arch=('any')
url="https://github.com/UberWriter/uberwriter"
license=('GPL3')
depends=('webkit2gtk' 'gspell' 'python-pypandoc' 'python-regex' 'python-levenshtein'
         'python-pyenchant' 'python-gobject' 'python-cairo')
makedepends=('python-setuptools')
optdepends=('texlive-core: Export as PDF files'
            'otf-fira-mono: Recommended font (OTF)'
            'ttf-fira-mono: Recommended font (TTF)')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('68d7abf443e841e07366d0db622f689327742ea052ba19b7695fedd3d959e16c')

prepare() {
	mv "Apostrophe-$pkgver" "$pkgname-$pkgver"
}

build() {
	"$pkgname-$pkgver"
	python setup.py build
}

package() {
	"$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
