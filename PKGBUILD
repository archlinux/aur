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
commit=ba534f791a548fe334f8403f4169255e5b0ae246
shortcommit=${commit:0:7}
gittag=v${version}

## Generic
pkgdesc="Escaped symbols for GNU Make"
arch=('any')
url="https://${hosting}/${owner}/${project}"
license=('MIT')
groups=()
depends=('make-escape')
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
	'948d0e2b229620cba95808f7ea8d0010'
	'SKIP'
)
sha1sums=(
	'82a1293b80010834997d115e0d157a03c13d7c61'
	'SKIP'
)
sha256sums=(
	'935aa1239593fb0fca9bc6795a3b368804dac6c9a0b70cf8acc86bb6752b2ec3'
	'SKIP'
)
sha224sums=(
	'3d988b71ad29463fe637505ad75aec38c45cb1c39fbcd3056c3180e9'
	'SKIP'
)
sha384sums=(
	'b30d629202565f2c4f011e22b680d734d8405bae63cca6178a3bb760751c215ce1e4a673d01026929b1faafed27c6f2b'
	'SKIP'
)
sha512sums=(
	'f2d469c541f79faaa5f8b7951e66f8a45a7dc052d0895abbf70b1e1a6ff495205a0beca611e2b509d80de8d61b9b7dbdb58f12bf361922edbe6f93ad7435ac17'
	'SKIP'
)
b2sums=(
	'a45ce3e18c1719a20c303df94340aa1e11f653965d930bcb357bb39dffdf4ff60a0663f986e6e815fe9630fee85b4bbc73d70aa28e48f9637468546f526a0f14'
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
