# Maintainer: Ivy Foster <code@escondida.tk>
# Contributor: Jan Fader <jan.fader@web.de>
# Reference: PKGBUILD(5)

pkgname=t-prot
pkgver=3.4
pkgrel=5
pkgdesc='Filter to improve readability of email/usenet by hiding annoyances'
url='https://www.escape.de/~tolot/mutt/'
license=(BSD)

depends=(gettext perl perl-locale-gettext)

arch=(any)
# LICENSE text from t-prot.1
source=(
	"https://www.escape.de/~tolot/mutt/t-prot/downloads/t-prot-$pkgver.tar.gz"
	LICENSE
)
md5sums=(
	c075489f1bd7063d589dcfb2536989b9
	712bd4102dde61b207be93a1f64d03bc
)

package() {
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/t-prot/LICENSE"

	cd "t-prot-$pkgver"

	install -D t-prot "$pkgdir/usr/bin/t-prot"
	install -D -m 644 t-prot.1 "$pkgdir/usr/share/man/man1/t-prot.1"
	install -D -m 644 README "$pkgdir/usr/share/doc/t-prot/README"
	cp -a contrib "$pkgdir/usr/share/doc/t-prot/"
}
