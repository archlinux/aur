# Maintainer: Torge Matthies <openglfreak at googlemail dot com>

pkgname=osu-handler
pkgdesc='Provides a handler for osu! file formats'
pkgver=0.1
pkgrel=1
arch=(any)
license=(AGPL3)
depends=(osu-mime desktop-file-utils python libnotify)
install='osu-handler.install'
source=(osu-wine.py
        osu-file-extensions-handler.desktop)
sha256sums=('a2b57b360c508dc195bd8b1fd95c69b8f007ec3a22eda894d8ac234356ff8d44'
            'b629d7f99652bb96bc8f381dde7e455ba66fc1b69b472ee7762b7f5a1f641dc8')

package() {
    cd "$pkgdir"

    install -D -m755 "$srcdir/osu-wine.py" 'usr/lib/osu-mime/osu-wine'
    install -D -m644 "$srcdir/osu-file-extensions-handler.desktop" 'usr/share/applications/osu-file-extensions-handler.desktop'
}
