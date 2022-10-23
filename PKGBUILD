# Maintainer: Furkan Baytekin (Elagoht) <furkanbaytekin@gmail.com>
pkgbase=passenger-pm-bin
pkgname=passenger-pm-bin
pkgver=1.0
pkgrel=2
pkgdesc="Built version of Passenger with secret algorithm. Use opensource for your algorithm."
arch=('x86_64')
url="https://github.com/Elagoht/Passenger"
license=('GPL')
replaces=("passenger-pm-git")
conflicts=("passenger-pm-git")
provides=("passenger-pm")
makedepends=("python" "python-pip")
optdepends=('git: sync passwords with git repo')
source=("https://github.com/Elagoht/Passenger/releases/download/v$pkgver/passenger-pm-1.0-1-x86_64.pkg.tar.zst")
noextract=("passenger-pm-1.0-1-x86_64.pkg.tar.zst")
sha256sums=('2829c5458d8fa769b1909fc352ac58b549fe515130eafa10b8eff4910d2e851e')
pkgver() {
    printf "$pkgver"
}
package() {
    tar -xf passenger-pm-1.0-1-x86_64.pkg.tar.zst
    rm passenger-pm-1.0-1-x86_64.pkg.tar.zst .[A-Z]*
    install -d "$pkgdir/usr/bin/"
    install -Dm755 "$srcdir/usr/bin/passenger-pm" -t "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/applications/"
    install -Dm644 "$srcdir/usr/share/applications/Passenger.desktop" -t "$pkgdir/usr/share/applications/"
    install -d "$pkgdir/usr/share/passenger-pm/"
    mv "$srcdir/usr/share/passenger-pm" "$pkgdir/usr/share/"
    rm -rf usr
}
