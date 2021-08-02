# Maintainer: Evan Bush (PencilShavings) <eb.pencilshavings@protonmail.com>

pkgname=quickemu-git
pkgver=r126.eae99eb
pkgrel=1
pkgdesc='Simple shell script to "manage" Qemu virtual machines.'
arch=('any')
url="https://github.com/wimpysworld/quickemu"
license=('MIT')
depends=('qemu')
makedepends=('git')
optdepends=('samba: file sharing support')
provides=('quickemu')
source=("$pkgname"::'git://github.com/wimpysworld/quickemu.git')
md5sums=('SKIP')

pkgver()
{
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package()
{
    cd "$srcdir/$pkgname"
    install -Dm644 LICENSE  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 quickemu "$pkgdir/usr/bin/quickemu"
}

