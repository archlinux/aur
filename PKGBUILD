# Contributor: SanskritFritz (gmail)

pkgname="mbkp-hg"
_pkgname="mbkp"
pkgver=102
pkgrel=1
epoch=1
pkgdesc="Provides modular backups using duplicity."
url="https://bitbucket.org/elifarley/mbkp/wiki/Home"
license=("GPL")
arch=("any")
depends=("duplicity")
makedepends=("mercurial" "perl")
provides=("mbkp")
conflicts=("mbkp")
source=("$_pkgname::hg+https://bitbucket.org/elifarley/mbkp")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	hg identify -ni | awk 'BEGIN{OFS=".";} {print $2}'
}

package() {
	cd "$srcdir/$_pkgname/installer"
	./install.sh "$pkgdir/usr"
}
