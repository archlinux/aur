# Maintainer: Kyle Keen <keenerd@gmail.com>
# Maintainer: Vsevolod Ivanov <seva@binarytrails.net>
# Contributor: Gilrain <pierre.buard+aur gmail com>
# Contributor: bruenig
pkgname=pacman-packer
pkgver=20160325
pkgrel=1
pkgdesc="Bash wrapper for pacman and aur"
url="http://github.com/binarytrails/pacman-packer"
license=("GPL3")
arch=('any')
makedepends=('git')
depends=('grep' 'sed' 'bash' 'curl' 'pacman' 'jshon' 'expac')
optdepends=('sudo: install and update packages as non-root'
            'customizepkg: apply customizepkg modifications')
source=('git+https://github.com/binarytrails/pacman-packer.git')
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

package() {
  install -Dm755 "$srcdir/$pkgname/packer" "$pkgdir/usr/bin/pacman-packer"
  install -Dm644 "$srcdir/$pkgname/packer.8" "$pkgdir/usr/share/man/man8/pacman-packer.8"
}

