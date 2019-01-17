# Maintainer: Volker Schatz <arch@my-name-without-hyphen.com>
pkgname=gladtex2
pkgver=3.0.0
pkgrel=1
pkgdesc="A utility for writing LaTeX equations within HTML - Python rewrite"
depends=('python>=3.4' 'texlive-bin' 'texlive-latexextra')
makedepends=('pandoc')
conflicts=('gladtex')
arch=('i686' 'x86_64')
license=('LGPL')
url="https://humenda.github.io/GladTeX/"
source=( "https://github.com/humenda/GladTeX/archive/v3.0.0.tar.gz" )
sha256sums=('319b5f1741f6635f0cc542527626def47578989af84d3fbce1413d24cefc89ce')

build() {
  cd "$srcdir/GladTeX-$pkgver"
  python ./setup.py build
}

package() {
  cd "$srcdir/GladTeX-$pkgver"
  python ./setup.py install --prefix=/usr --root="$pkgdir"
  install -m 644 -D build/gladtex.1 "$pkgdir"/usr/man/man1/gladtex.1
}

# vim: set ts=2 sw=2 et:
