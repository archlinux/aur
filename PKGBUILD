pkgname=spm-arch
pkgver=2.7
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
sha256sums=('909214c348e5b4a5b249922fa9d0f86dfa671817e5f4a3438f465b10d00f9751')

package() {
    cd "$srcdir/Simple_Package_Manager-$pkgver"

    install -Dm755 spm.sh "$pkgdir/usr/bin/spm"
    install -Dm755 spm_updates.sh "$pkgdir/usr/bin/spm_updates"
    install -Dm644 spm_updates.timer "$pkgdir/usr/lib/systemd/system/spm_updates.timer"
    install -Dm644 spm_updates.service "$pkgdir/usr/lib/systemd/system/spm_updates.service"
    install -Dm644 spm_header_cache.hook "$pkgdir/usr/share/libalpm/hooks/spm_header_cache.hook"
}