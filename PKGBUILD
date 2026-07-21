# Maintainer: Aditya An1l <aditya.anil.productions@gmail.com>
pkgname=lidhandler
pkgver=1.3.1
pkgrel=1
pkgdesc="Toggle laptop lid switch suspend behavior via systemd-logind"
arch=('any')
url="https://github.com/aditya-an1l/LidHandler"
license=('MIT')
depends=('systemd')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

# GitHub archives extract to RepoName-Tag
_repodir="LidHandler-$pkgver"

package() {
  install -Dm755 "$srcdir/$_repodir/src/lidhandler" "$pkgdir/usr/bin/lidhandler"
  install -Dm644 "$srcdir/$_repodir/config/lidhandler.conf" "$pkgdir/etc/systemd/logind.conf.d/10-lidhandler.conf"
  install -Dm644 "$srcdir/$_repodir/docs/lidhandler.1" "$pkgdir/usr/share/man/man1/lidhandler.1"
}
