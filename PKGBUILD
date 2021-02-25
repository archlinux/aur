# Maintainer: GiacoLenzo2109 <GiacoLenzo2109@gmail.com>
# Contributor: Librewish <librewish@gmail.com>


pkgbase=croco-i3-settings
_gitname=croco-i3-settings
pkgname=(
    'croco-i3-settings'
    )
pkgver=r2.c20daec
pkgrel=1
arch=('any')
_branch='master'
url="https://gitlab.com/croco-os/themes-and-settings/settings/croco-i3-settings"
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
	cd "$srcdir/croco-i3-settings"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

package_croco-i3-settings() {
    pkgdesc='croco Linux i3 settings'
    depends=(
	'croco-common-settings'
        )
   
    install=croco-i3-settings.install
    provides=('croco-desktop-settings')
    conflicts=('croco-desktop-settings')

    _install ''
}

