# Maintainer: Berke Oruc <berke3oruc@gmail.com>
# Contributor: Berke Oruc <berke3oruc@gmail.com>

pkgname=bros-try
pkgver=1.0.0
pkgrel=1
pkgdesc="Bros OS Virtual Machine Launcher - GUI ile Bros OS'i dene"
arch=('x86_64')
url="https://bros.berkeai.com"
license=('PROPRIETARY')
depends=('python3' 'python tk' 'qemu')
provides=('bros-try')
conflicts=('bros')
backup=('~/.config/bros-try/config.json')
source=("$pkgname-$pkgver.tar.gz")
sha256sums=('SKIP')
options=('!emptydirs')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/bros-try-gui" "$pkgdir/usr/bin/bros-try"
    install -Dm755 "$srcdir/$pkgname-$pkgver/bros-try" "$pkgdir/usr/bin/bros-try-cli"
    install -Dm644 "$srcdir/$pkgname-$pkgver/bros-try.desktop" "$pkgdir/usr/share/applications/bros-try.desktop"
    install -Dm644 "$srcdir/$pkgname-$pkgver/bros-try.conf" "$pkgdir/etc/bros-try.conf"
    
    mkdir -p "$pkgdir/usr/share/doc/$pkgname"
    cp -r "$srcdir/$pkgname-$pkgver/docs/"* "$pkgdir/usr/share/doc/$pkgname/"
}
