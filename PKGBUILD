pkgname=spm-arch
pkgver=2.3
pkgrel=1
pkgdesc="Simple Package Manager - Interactive fzf tui for Arch package management"
arch=('any')
url="https://github.com/adelmonte/Simple_Package_Manager"
license=('GPL-3.0-or-later')
depends=('fzf' 'yay')
provides=('spm')
conflicts=('spm')
install=spm.install
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/spm-$pkgver.tar.gz")
sha256sums=('9e2be457346627c35b312bb4276559d304fdf786ad276835ed7cabc566b9025b')

package() {
    cd "$srcdir"
    
    install -Dm755 spm.sh "$pkgdir/usr/bin/spm"
    install -Dm755 spm_updates.sh "$pkgdir/usr/bin/spm_updates"
    install -Dm644 spm_updates.timer "$pkgdir/usr/lib/systemd/system/spm_updates.timer"
    install -Dm644 spm_updates.service "$pkgdir/usr/lib/systemd/system/spm_updates.service"
}