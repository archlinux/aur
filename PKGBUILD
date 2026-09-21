# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=output-as-format
pkgver=0.04
pkgrel=1
pkgdesc="Take stdin and format it as a GitHub/Slack/Jira-formatted code/quote block"
arch=('any')
url="https://github.com/sshaw/output-as-format"
license=('custom:none')
depends=('perl')
makedepends=('perl-extutils-makemaker')
_tag="v0.04"
_srcdir="output-as-format-0.04"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/sshaw/output-as-format/tar.gz/refs/tags/$_tag")
sha256sums=('67f396972b6ccd69820af4f51e1232673f282f078f19c5113c731d2f304ac38a')
function build() {
	cd "$_srcdir"
	perl Makefile.PL INSTALLDIRS=vendor
	make
}
function package() {
	cd "$_srcdir"
	make DESTDIR="$pkgdir" install
	find "$pkgdir" -name "*.3pm" -delete
	find "$pkgdir" -name ".packlist" -delete
	find "$pkgdir" -name "perllocal.pod" -delete
}
