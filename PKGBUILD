# Maintainer: Ebrahim Azarisooreh <ebrahim.azarisooreh@gmail.com>

_pkgnum=3111
pkgname=logtalk
pkgver=3.11.1
pkgrel=3
pkgdesc='Object-Oriented Logic Programming Language'
arch=('x86_64' 'i686')
url='http://logtalk.org/'
license=('APACHE')
depends=()
makedepends=()
optdepends=(
	'swi-prolog: Prolog backend for logtalk'
	'gprolog: Prolog backend for logtalk'
	'yap: Prolog backend for logtalk'
)
source=("https://github.com/LogtalkDotOrg/logtalk3/archive/lgt${_pkgnum}stable.tar.gz")
sha256sums=('ae3829fede61125ab5ea2aefc5fe03a0a46ceee1f3fca75fe8a484272630bb20')
conflicts=()
provides=('logtalk')
install=logtalk.install


package() {
	LOGTALKHOME="$pkgdir/usr/lib/$pkgname"
	mkdir -p "$LOGTALKHOME"

	cd "logtalk3-lgt${_pkgnum}stable"

	scripts/install.sh -p "$LOGTALKHOME" > /dev/null 2>&1

	install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
