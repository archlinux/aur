# Maintainer: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>
pkgname=eso-wallpapers-git
pkgver=d5109ca
pkgrel=1
pkgdesc="A collection of cool wall papers!"
arch=('any')
groups=('therepoclub')
url="https://github.com/EndeavourOS-Community-Editions/Community-wallpapers"
license=('GPL')
optdepends=('feh: Allows setting wallpaper' 'multimonitorlock-gui: Allows the background to be changed')
makedepends=('git')
source=("${pkgname}::git+https://github.com/EndeavourOS-Community-Editions/Community-wallpapers")
sha256sums=("SKIP")

pkgver() {
    cd $pkgname
    git describe --long --always | sed 's/^v//; s/-/.r/; s/-/./'
}

package() {
    cd $pkgname
    mkdir -p $pkgdir/usr/share/backgrounds
    cp -a $srcdir/$pkgname/* $pkgdir/usr/share/backgrounds/
}
