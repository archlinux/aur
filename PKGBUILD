
pkgbase=plymouth-theme-croco
_gitname=plymouth-theme-croco
pkgname=(
    'plymouth-theme-croco'
    )
pkgver=r2.7389d96
pkgrel=1
arch=('any')
_branch='master'
url="https://gitlab.com/croco-os/themes-and-settings/plymouth-theme-croco"
license=('GPL')
makedepends=('git')
source=("git+$url.git#branch=${_branch}")
sha256sums=('SKIP')

_install() {
    if [[ -d $srcdir/$_gitname/$1/etc ]]; then
        install -d $pkgdir/etc
        cp -rf $srcdir/$_gitname/$1/etc $pkgdir
    fi

    if [[ -d $srcdir/$_gitname/$1/usr ]]; then
        install -d $pkgdir/etc
        cp -rf $srcdir/$_gitname/$1/usr $pkgdir
    fi
    
    if [[ -d $srcdir/$_gitname/$1/skel ]]; then
        install -d $pkgdir/etc
        cp -rf $srcdir/$_gitname/$1/skel $pkgdir/etc
    fi

}

pkgver() {
	cd "$srcdir/plymouth-theme-croco"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

package_plymouth-theme-croco() {
    pkgdesc='plymouth-theme-croco'
    depends=() 
    install=plymouth.install
    _install ''
}
 
