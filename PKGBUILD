# Maintainer: excalibur1234 @forum.manjaro.org

pkgname=pacui
pkgver=1.7
pkgrel=1
pkgdesc="Bash script providing advanced Pacman and Pacaur/Yaourt functionality in a simple UI"
arch=(any)
url="https://github.com/excalibur1234/$pkgname"
license=('GPL3')
depends=('expac' 'wget' 'sudo' 'fzf')
makedepends=('git')
conflicts=("pacui-git" 'pacli-simple-git')
optdepends=('pacaur: Needed for AUR support. If installed, it gets used by default over Yaourt.'
        'yaourt: Needed for AUR support.'
        'pacman-mirrors: Needed for Manjaro mirror support'
        'reflector: Needed for Arch Linux mirror support'
        'downgrade: Needed for hidden "downgrade" option.')
source=("$pkgname::git+https://github.com/excalibur1234/$pkgname.git")
md5sums=('d24da2eab1c00d7cb15bfb36e7eb57bf')

# how to update md5sum:
#  1. do "updpkgsums" inside the folder with PKGBUILD file
#  2. delete .tar.gz file

package () {
	cd "$srcdir"
        install -Dm755 "$srcdir/$pkgname/pacui" "$pkgdir/usr/bin/pacui"
}
