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
commit=e1cb819d70daeb165f495b07799cd78d0e3dd486
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
	'265dcb4078886f16246e92cf56ab0402'
	'SKIP'
)
sha1sums=(
	'5141fd2d8786c58535e6e879c4e4fcd1060cd5c5'
	'SKIP'
)
sha256sums=(
	'fd40227a275328e911d347a13903f9d7f2bad4dd5c12d0c1dd71a548f7e94a1c'
	'SKIP'
)
sha224sums=(
	'395bbb2fa6b690d1b5933f9b2f06a1d3f0857c060cb2a1fb5b541092'
	'SKIP'
)
sha384sums=(
	'd175be394ae9aa59cac70ae2a96b37347abd8b19686efb96569f5445f94cc1a9cbe9830643b08ecb4fcc8b5ccbb56ca0'
	'SKIP'
)
sha512sums=(
	'1970c4b0315972daf469180c88e02057d0a74ecf577dcada91bf2d55b6294dc303e43ad04a7aa587f15cd00e9de23633e940f40ce49bda6d958fa90cd4c75bd9'
	'SKIP'
)
b2sums=(
	'c520ca999b3b9addd08af4791d5980b539458bb56f819ff67c30de7f7ec781e988d00b2a3ea9f00b040d5d80d3a0ab3ba6913d09592ad7fc31c90934e4aec411'
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
