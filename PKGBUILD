# Maintainer: bozidarsk <aaaa@gmail.com>
name='installaur'
pkgname="$name-git"
pkgver=2
pkgrel=1
pkgdesc="Aur helper/installer."
arch=('x86_64')
url="https://github.com/bozidarsk/$name"
license=('unknown')
depends=('mono')
makedepends=('git' 'mono')

# to update version
# makepkg --printsrcinfo > .SRCINFO

prepare() 
{
	git clone "$url.git" --recurse-submodules "$srcdir/$name"
}

build() 
{
	cd "$srcdir/$name"
	mcs '-recurse:*.cs' -define:NO_FILES -out:"$name"
}

package() 
{
	install -vDm755 "$srcdir/$name/$name" -t "$pkgdir/usr/bin/"
}
