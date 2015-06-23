# Maintainer: aksr <aksr at t-com dot me>
pkgname=cwebx
_pkgname=cweb
pkgver=3.52
_pkgver=x3.52
pkgrel=1
epoch=
pkgdesc="The CWEBx system for Structured Software Documentation (Literate Programming) in C."
arch=(any)
url="http://wwwmathlabo.univ-poitiers.fr/~maavl/CWEBx/"
license=('unknown')
groups=()
depends=('texlive-core')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=cweb.install
changelog=
source=("http://wwwmathlabo.univ-poitiers.fr/~maavl/CWEBx/$_pkgname-$_pkgver.tgz")
noextract=()
md5sums=('30fadade903fd110eb4478962ab21016')
sha1sums=('5d087aa6413bdce69f1cf16c797779ace5c3e086')
sha256sums=('92e57b4414388743bd0b91d81c91bea4645a8b04c8f744754b0855e90934186b')

build() {
	cd "$srcdir/$_pkgname-$_pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$_pkgname-$_pkgver"
	make -k check
}

package() {
	cd "$srcdir/$_pkgname-$_pkgver"
  mkdir -p $pkgdir/usr/{share/doc/$pkgname,share/man/man1,share/texmf/tex/cwebx}
  install -D -m755 cweavex $pkgdir/usr/bin/cweavex
  install -D -m755 ctanglex $pkgdir/usr/bin/ctanglex
  install -D -m755 ctanglex $pkgdir/usr/bin/ctanglex
  install -D -m644 README $pkgdir/usr/share/doc/$pkgname/README
  install -D -m644 cweave.dvi $pkgdir/usr/share/doc/$pkgname/cweave.dvi
  install -D -m644 ctangle.dvi $pkgdir/usr/share/doc/$pkgname/ctangle.dvi
  install -D -m644 common.dvi $pkgdir/usr/share/doc/$pkgname/common.dvi
  install -D -m644 manual.dvi $pkgdir/usr/share/doc/$pkgname/manual.dvi
  install -D -m644 man1/cweb.1 $pkgdir/usr/share/man/man1/cwebx.1
  install -D -m644 cwebcmac.tex $pkgdir/usr/share/texmf/tex/cwebx/cwebcmac.tex
  install -D -m644 cwebhmac.tex $pkgdir/usr/share/texmf/tex/cwebx/cwebhmac.tex
  install -D -m644 cwebxmac.tex $pkgdir/usr/share/texmf/tex/cwebx/cwebxmac.tex
  cp -r --no-preserve=ownership,mode examples $pkgdir/usr/share/doc/$pkgname/examples
}

