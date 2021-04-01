## Maintainer: Esaú García Sánchez-Torija <egasato.dev@gmail.com>

## Version
pkgname=make-escape
pkgver=0.1.0
pkgrel=1

## My variables
hosting=gitlab.com
owner=egasato
project=$pkgname
version=$pkgver
commit=71f2cdb3b2601df8f8707dd44205dbdd0d67d4bd
shortcommit=${commit:0:7}
gittag=v${version}

## Generic
pkgdesc="Escaped symbols for GNU Make"
arch=('any')
url="https://${hosting}/${owner}/${project}"
license=('MIT')
groups=()
depends=()
makedepends=('coreutils')
checkdepends=()
optdepends=()

## Package relations
provides=()
conflicts=()
replaces=()

## Others
backup=()
options=()
install=
changelog=ChangeLog

## Sources
source=(
	"https://${hosting}/${owner}/${project}/-/archive/${gittag}/${project}-${gittag}.tar.bz2"
	"https://downloads.sourceforge.net/project/${owner}-${project}/${gittag}/${project}-${gittag}.tar.bz2.sig"
)
noextract=()
validpgpkeys=('278775DF8230FE08784729E3DCCA6B78DD448CAE')

## Integrity
md5sums=(
	'716022b9074e394123b6b5b4d25e0ff8'
	'SKIP'
)
sha1sums=(
	'ba3fa93aac2751fae508b6affc55e08d8b3bea57'
	'SKIP'
)
sha256sums=(
	'd0b10a4564cfbef9575e377a0dff60e278f1fa2c0d81ef016e0452a3180f02f1'
	'SKIP'
)
sha224sums=(
	'62c8172bb34873431885f7741848987cb5af6351b1668509efc59fd4'
	'SKIP'
)
sha384sums=(
	'd6b840512775607f75222aa8187c135d53edf5bb5ad64973512242fd95feee0cf297152ef8380d637b560b80b4ba9683'
	'SKIP'
)
sha512sums=(
	'b68b98a4e2cdc7db21c6cdff6ef57381099b97df6a98ad3e03c395cdb19f90e86eb13fd909f112708b6fa2e284ad3b74787199ec804bfbfead2c8fcadbdaed50'
	'SKIP'
)
b2sums=(
	'ee282a070764805dd09a6b257902e208457e9cec72b26e162e2d361af1779d2dcff4ee84fa95ef5007f259e18a02d27d9520c3a3b11f4355b147ea3920d651d0'
	'SKIP'
)

## Packaging functions

package() {
	: # Nothing to package
}

prepare() {
	: # Nothing to prepare
}

build() {
	: # Nothing to build
}

check() {
	cd "$srcdir/${project}-${gittag}"
	make test
}

package() {
	cd "$srcdir/${project}-${gittag}"
	make install DESTDIR="$pkgdir"              \
	             PREFIX='/usr'                  \
	             INCLUDEDIR='$(PREFIX)/include' \
	             SYSCONFDIR='/etc'              \
	             ENABLE_PROFILED_EXPORT=yes
}
