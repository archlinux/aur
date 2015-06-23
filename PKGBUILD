# Maintainer: John Jenkins twodopeshaggy@gmail.com
# Contribuitor: Lara Maia <lara@craft.net.br>
# Contribuitor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
pkgname=nettop
pkgver=0.2.3
pkgrel=6
pkgdesc="Network packets monitor."
arch=('i686' 'x86_64')
url="https://github.com/gim-/nettop"
license=('BSD')
depends=('slang' 'libpcap')
source=("https://github.com/gim-/nettop/archive/v${pkgver}.tar.gz")
sha256sums=('adf522b91a2ba9b6f3bcc4bab67317e51c55f751709bef813240353f02ba8d23')

build() {
    cd ${srcdir}/$pkgname-$pkgver/src/
    ./configure --prefix="/usr" --sysconfdir="/etc/nettop"
    make
}
  
package(){  
    cd "$srcdir/$pkgname-$pkgver/src/"

    install -d "$pkgdir/usr/bin"
    make prefix="$pkgdir/usr" install

    # License
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    cp "../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
