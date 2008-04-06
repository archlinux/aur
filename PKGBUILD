# $Id: PKGBUILD,v 1.4 2006/01/20 13:51:15 arjan Exp $
# Maintainer: Jason Chu <jason@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=latex2rtf
pkgver=1.9.16
pkgrel=1
pkgdesc="LaTeX to RTF converter"
depends=('glibc' 'imagemagick' 'ghostscript')
source=(http://dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
  make PREFIX=/usr || return 1
  make PREFIX=$startdir/pkg/usr install
  sed -i -e 's|error "no input file specified"| echo "error: no input file specified"|' $startdir/pkg/usr/bin/latex2png
}
md5sums=('4ea77702da5e61632a595f604914ebe9')
