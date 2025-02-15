# Maintainer: tee < teeaur at duck dot com >
_pkg=sqlpage
pkgname=sqlpage-bin
pkgver=0.33.0
pkgrel=1
pkgdesc='Fast SQL-only data application builder. Automatically build a UI on top of SQL queries.'
arch=(x86_64)
url='https://sql-page.com'
_git='https://github.com/sqlpage/SQLPage'
license=('MIT')
provides=($_pkg)
conflicts=($_pkg)
source=("$_pkg.service::$_git/raw/refs/tags/v$pkgver/sqlpage.service")
source_x86_64=("sqlpage-$pkgver.tgz::$_git/releases/download/v$pkgver/sqlpage-linux.tgz")
sha256sums=('523af5ae51e73365b7e7a8e2ce67c8b1eeb778a96792827581e3de1f41cac373')
sha256sums_x86_64=('7ce84998cca291901c99c1e89d4387ddefa925e4d64cf20a0f91467323d50400')

package() {
    install -Dm0755 sqlpage.bin "$pkgdir/usr/bin/sqlpage"
    install -dm644 "$pkgdir/usr/share/sqlpage"
    install -dm755 "$pkgdir/usr/lib/systemd/system"
	cp $_pkg.service "$pkgdir/usr/lib/systemd/system"
	cp -a sqlpage/* "$pkgdir/usr/share/sqlpage"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
