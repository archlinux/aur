
# Maintainer: excalibur1234 @forum.manjaro.org

_pkgname=pacui
pkgname=$_pkgname-git
pkgver=r898.e0b668b
pkgrel=1
pkgdesc="Bash script providing advanced Pacman and Yay/Pikaur/Aurman/Pakku/Trizen/Pacaur functionality in a simple UI"
arch=(any)
url="https://github.com/excalibur1234/$_pkgname"
license=('GPL3')
depends=('pacman-contrib' 'expac' 'wget' 'sudo' 'fzf')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
optdepends=('yay: One AUR helper is needed for AUR support.'
            'pikaur: One AUR helper is needed for AUR support.'
            'aurman: One AUR helper is needed for AUR support.'
            'pakku: One AUR helper is needed for AUR support.'
            'trizen: One AUR helper is needed for AUR support.'
            'pacaur: One AUR helper is needed for AUR support.'
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
