## Maintainer: Esaú García Sánchez-Torija <egasato.dev@gmail.com>

## Version
pkgname=make-support
pkgver=0.1.0
pkgrel=1

## My variables
hosting=gitlab.com
owner=egasato
project=$pkgname
version=$pkgver
commit=40fe5183a52ae9d96c5de75f59a91a98c5c57c72
shortcommit=${commit:0:7}
gittag=v${version}

## Generic
pkgdesc="Escaped symbols for GNU Make"
arch=('any')
url="https://${hosting}/${owner}/${project}"
license=('MIT')
groups=()
depends=('make-escape')
makedepends=('make' 'coreutils' 'sed' 'make-escape')
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
	'61d66e92c1afe86471954eaae3d2d89e'
	'SKIP'
)
sha1sums=(
	'405380dff7e447e8d24fe16877e642da64192458'
	'SKIP'
)
sha256sums=(
	'8d58bbe2460d01502738e0c8e72af2e04b44a9d877d526bc9c29c8270f03d9c4'
	'SKIP'
)
sha224sums=(
	'dccb3514249eb139c6ae5646b410e5bbe6e640a467adc423de5b796c'
	'SKIP'
)
sha384sums=(
	'8b85502544a419caf29b0acf7ef5a98458a5ce1d95b2a8ebcbe68a01d70e1b32efd2cb3836696b6f805420ccf1552248'
	'SKIP'
)
sha512sums=(
	'ec2c59f0f3cb004b1fbbe48b50f9b7d79b42c7b3f019dc5a2882146560f5b5543ae092f5d27155e0eaa8898ba290900b90c19076a21580de4579dec79033aae1'
	'SKIP'
)
b2sums=(
	'b6af1101226f1a5a9d9fd3fbf5514ec8bb28958cb38b230c06884c057ebf96b3ee2f4d2c4bfb78fcbd4776bbe696c0738e8c3e6486bd5a9dd9f6408c32f37a44'
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
