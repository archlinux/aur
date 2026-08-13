# Maintainer: Serhan Aydinicen <saydinicen9@gmail.com>

pkgname=memokeel
_id=com.conqrex.memokeel
pkgver=0.2.0
pkgrel=1
pkgdesc='KDE Plasma 6 widget for notes, to-dos, kanban boards, reminders, and tags'
arch=('any')
url='https://github.com/Conqrex/Conqrex.MemoKeel'
license=('MIT')
depends=('plasma-workspace' 'jq' 'file')
optdepends=('libnotify: fallback desktop notifications via notify-send')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e961b52daebcfc0accbdeeb8665774a90b03b170c9bcc65a437b2bc84a911bac')

package() {
    install -dm755 "$pkgdir/usr/share/plasma/plasmoids/$_id"
    cp -a "$srcdir"/*/package/. "$pkgdir/usr/share/plasma/plasmoids/$_id/"
    install -Dm644 "$srcdir"/*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir"/*/package/contents/icons/$_id.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_id.svg"
}
