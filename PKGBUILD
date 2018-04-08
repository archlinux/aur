# Maintainer: excalibur1234 @forum.manjaro.org

_pkgname=pacui
pkgname=$_pkgname-git
pkgver=r835.70f6032
pkgrel=1
pkgdesc="Bash script providing advanced Pacman and Trizen/Yay/Yaourt/Pikaur/Pacaur functionality in a simple UI"
arch=(any)
url="https://github.com/excalibur1234/$_pkgname"
license=('GPL3')
depends=('expac' 'wget' 'sudo' 'fzf')
makedepends=('git')
provides=('pacui')
conflicts=("$_pkgname")
optdepends=('pacaur: Needed for AUR support.'
        'yaourt: Needed for AUR support.'
        'yay: Needed for AUR support.'
        'trizen: Needed for AUR support.'
        'pikaur: Needed for AUR support.'
        'pacman-mirrors: Needed for Manjaro mirror support'
        'reflector: Needed for Arch Linux mirror support'
        'downgrade: Needed for hidden "downgrade" option.')
source=("$_pkgname::git+https://github.com/excalibur1234/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
        cd "$srcdir/$_pkgname"
        echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package () {
        install -Dm755 "$srcdir/$_pkgname/pacui" "$pkgdir/usr/bin/pacui"
}
