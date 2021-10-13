# Maintainer: Evan Bush (PencilShavings) <eb.pencilshavings@protonmail.com>

pkgname=quickemu-git
pkgver=r298.018fb1c
pkgrel=1
pkgdesc='Simple shell script to "manage" Qemu virtual machines.'
arch=('any')
url="https://github.com/wimpysworld/quickemu"
license=('MIT')
depends=('qemu' 'coreutils' 'grep' 'jq' 'procps' 'python3' 'cdrtools' 'usbutils' 'util-linux' 'sed' 'spice-gtk' 'swtpm' 'wget' 'xorg-xrandr' 'zsync' 'edk2-ovmf')
makedepends=('git')
#optdepends=('samba: file sharing support')
provides=('quickemu')
conflicts=('qucikemu')
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
    install -Dm755 quickget "$pkgdir/usr/bin/quickget"
    install -Dm755 macrecovery "$pkgdir/usr/bin/macrecovery"
}

