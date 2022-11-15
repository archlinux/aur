# Maintainer: Ivy Foster <iff@archlinux.org>
# Contributor: Jan Fader <jan.fader@web.de>
# Reference: PKGBUILD(5)

pkgname=t-prot
pkgver=3.4
pkgrel=6
pkgdesc='Filter to improve readability of email/usenet by hiding annoyances'
# https://escape.de/~tolot appears to be dead.
url='https://github.com/kdave/t-prot'
license=(BSD)

depends=(gettext perl perl-locale-gettext)
makedepends=(git)

arch=(any)
# LICENSE text from t-prot.1
source=(
	'git+https://github.com/kdave/t-prot.git#commit=9301fda1d84f573a731d1a4c24520220c5017032'
	LICENSE
)
sha256sums=(SKIP SKIP)

package() {
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/t-prot/LICENSE"

	cd t-prot
	install -D t-prot "$pkgdir/usr/bin/t-prot"
	install -D -m 644 t-prot.1 "$pkgdir/usr/share/man/man1/t-prot.1"
	install -D -m 644 README "$pkgdir/usr/share/doc/t-prot/README"
	cp -a contrib "$pkgdir/usr/share/doc/t-prot/"
}
