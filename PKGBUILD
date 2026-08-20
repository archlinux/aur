# Maintainer: Serhan Aydinicen <saydinicen9@gmail.com>

pkgname=memokeel
_id=com.conqrex.memokeel
pkgver=0.2.1
pkgrel=1
pkgdesc='KDE Plasma 6 widget for notes, to-dos, kanban boards, reminders, and tags'
arch=('any')
url='https://github.com/Conqrex/Conqrex.MemoKeel'
license=('MIT')
depends=('plasma-workspace' 'jq' 'file')
optdepends=('libnotify: fallback desktop notifications via notify-send')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8038453d567d64383c9325a08225f1a13e6b1852d1233da981a8813e115500ab')

package() {
    install -dm755 "$pkgdir/usr/share/plasma/plasmoids/$_id"
    cp -a "$srcdir"/*/package/. "$pkgdir/usr/share/plasma/plasmoids/$_id/"
    install -Dm644 "$srcdir"/*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir"/*/package/contents/icons/$_id.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_id.svg"
}
