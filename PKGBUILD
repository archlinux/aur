# Maintainer: Andreas Louv <andreas@louv.dk>

pkgname=rpglelint-git
pkgver=0.0.0
pkgrel=1
pkgdesc="Lint ILE/RPG programs"
arch=("any")
url="https://github.com/andlrc/rpglelint"
license=("PerlArtistic")
depends=("perl>=5.16")
makedepends=("git")
provides=("rpglelint")
source=('rpglelint::git+git://github.com/andlrc/rpglelint#branch=master')
md5sums=("SKIP")

package()
{
	cd "$srcdir/${pkgname%-git}"
	install -D rpglelint $pkgdir/usr/bin/rpglelint
	install -Dm644 rpglelint.1 $pkgdir/usr/share/man/man1/rpglelint.1
	install -Dm644 RPG/Parser.pm $pkgdir/usr/share/perl5/vendor_perl/RPG/Parser.pm
	install -Dm644 RPG/Linter.pm $pkgdir/usr/share/perl5/vendor_perl/RPG/Linter.pm
	install -Dm644 RPG/Statement.pm $pkgdir/usr/share/perl5/vendor_perl/RPG/Statement.pm
}
