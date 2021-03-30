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
commit=0dfba4b8a8332721004250b27c9a7ea8ade0d4bc
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
	'489bde0a9f0b7f102e82a1e288385aa7'
	'SKIP'
)
sha1sums=(
	'2cacaf3890fad31f56298fd132db4480cddadb57'
	'SKIP'
)
sha256sums=(
	'1411538c1975905cd28be92d6d5b75ac4d28faf3a3bfc2d204a16361a76edddb'
	'SKIP'
)
sha224sums=(
	'be8bf5e4ee1e47ba369a578c535f5637295049118536dc6d3957cf2d'
	'SKIP'
)
sha384sums=(
	'f965d47a573ac412a54a7e0900c9a78df048101eef1c4c08e604dff5607c1c8a8ad89cfe40c158665581e1607dc6445d'
	'SKIP'
)
sha512sums=(
	'a81dfed49e082df4a669dc76959894c786e88f60ad19a55b28961b19da526fcfc010f35e9502240a2cbccc7e8a58a95cf2f96ef33a97d01740bc8374f4ea828f'
	'SKIP'
)
b2sums=(
	'fb0536b0271e407cea2b504b740dd09a1c1bd412d121c7569168ee324f7ba37fd35c406d85c8bf4859b336d3af10d4a2b186d656fdae573ebde81b6aa1a30ff1'
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
