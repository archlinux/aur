pkgname=spm-arch
pkgver=3.0.1
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
sha256sums=('c350efe62b59ff8bb2701b4a24aab80e6b158d0a7094792afdf076355493c8f7')

package() {
    cd "$srcdir/Simple_Package_Manager-$pkgver"

    install -Dm755 spm.sh "$pkgdir/usr/bin/spm"
    install -Dm755 spm_updates.sh "$pkgdir/usr/bin/spm_updates"
    install -Dm644 spm_updates.timer "$pkgdir/usr/lib/systemd/system/spm_updates.timer"
    install -Dm644 spm_updates.service "$pkgdir/usr/lib/systemd/system/spm_updates.service"
    install -Dm644 spm_header_cache.hook "$pkgdir/usr/share/libalpm/hooks/spm_header_cache.hook"
}