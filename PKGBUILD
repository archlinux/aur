# Maintainer: Dusan Baran <work.dusanbaran@gmail.com>

_pkgname=litify
pkgname=litify-git
pkgver=96590e0
pkgrel=1
pkgdesc="LITify git"
arch=('any')
url="https://github.com/dudoslav/${_pkgname}"
license=('GPL3')
depends=('git'
	 'pacman')
optdepends=('noto-fonts-emoji'
	    'unicode-emoji')
source=("git+https://github.com/dudoslav/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --always | sed -e 's|-|.|g'
}

package() {
    cd "$srcdir/$_pkgname"
    install -m 755 -D "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -m 644 -D 'lit' "$pkgdir/etc/lit"
}

