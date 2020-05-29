# Maintainer: KnockKnockP <memeboi420666 at gmail dot com>
#                         (What a silly email, I regret making it like this.).

pkgname=("stretchy-snek-boi-git")
_pkgname=("stretchy-snek-boi")
pkgver=1.0.13.r0.g06fa9e9
pkgrel=1
pkgdesc="A snake game clone."
arch=("x86_64")
license=("WTFPL 2.0")
url="https://www.github.com/KnockKnockP/stretchy-snek-boi/"
source=("stretchy-snek-boi::git+https://www.github.com/KnockKnockP/stretchy-snek-boi.git")
depends=("git")
md5sums=("SKIP")

pkgver() {
    cd "$_pkgname"
    git describe --tags --long | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

build() {
	cd "$_pkgname/source/"
	make git
}

package() {
	cd "$_pkgname/source/"
	mkdir $pkgdir/usr/bin/ -p
	make DESTDIR="$pkgdir/usr/bin" install-git
}