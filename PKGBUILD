# Maintainer: Alban Guyon <albanguyon@yahoo.fr>
pkgname=delete-old-downloads
pkgver=0.0.10
pkgrel=1
pkgdesc="Deletes files in your download folder if they have not been modified in the specified number of days"
arch=('any')
url="https://github.com/3nabla3/delete-old-downloads"
license=('WTFPL')
depends=('bash' 'systemd' 'xdg-user-dirs')
install="$pkgname.install"
backup=('etc/delete-old-downloads/users.list')
source=("$pkgname-$pkgver.tar.gz::https://github.com/3nabla3/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b8cec9d13b050a20113adae0eb39d1fd0655db0cf7c9b384a6c3ce637632245f')

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "usr/bin/delete_old_downloads.sh" \
        "$pkgdir/usr/bin/delete_old_downloads.sh"

    install -Dm644 "etc/systemd/system/delete-old-downloads.service" \
        "$pkgdir/usr/lib/systemd/system/delete-old-downloads.service"

    install -Dm644 "etc/systemd/system/delete-old-downloads.timer" \
        "$pkgdir/usr/lib/systemd/system/delete-old-downloads.timer"

    install -Dm644 "usr/share/delete-old-downloads/users.list" \
        "$pkgdir/usr/share/delete-old-downloads/users.list"
}
