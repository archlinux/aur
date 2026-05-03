pkgname=spm-arch
pkgver=2.9
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
sha256sums=('28887c288161f56c387c429f3e95dc9265123dd8605e7caa872b878bac57b53c')

package() {
    cd "$srcdir/Simple_Package_Manager-$pkgver"

    install -Dm755 spm.sh "$pkgdir/usr/bin/spm"
    install -Dm755 spm_updates.sh "$pkgdir/usr/bin/spm_updates"
    install -Dm644 spm_updates.timer "$pkgdir/usr/lib/systemd/system/spm_updates.timer"
    install -Dm644 spm_updates.service "$pkgdir/usr/lib/systemd/system/spm_updates.service"
    install -Dm644 spm_header_cache.hook "$pkgdir/usr/share/libalpm/hooks/spm_header_cache.hook"
}