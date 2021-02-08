# Maintainer: Andrey Gorshkov <spacebiker@airmail.cc>

pkgname=afetch-asm-git
_pkgname=afetch-asm
pkgver=1
pkgrel=1
epoch=
pkgdesc="A command-line system information tool written in x86 assembly language"
arch=("x86" "x86_64")
url="https://github.com/sticky-tea/afetch"
license=('GPL')
groups=()
depends=()
makedepends=(
	'git'
	'fasm' 
	'make'
)
checkdepends=()
optdepends=('lsb-release: OS information')
provides=('afetch')
conflicts=('afetch')
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+https://github.com/sticky-tea/afetch"
)
noextract=()
md5sums=("SKIP")


build() 
{
    cd "$pkgname"
    make all
}

package() 
{
    cd "$pkgname"
    install -D -m755 "${srcdir}/${pkgname}/afetch" "${pkgdir}/usr/bin/afetch"
}
