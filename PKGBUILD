# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=ttf-emojione
pkgver=4.0.1
pkgrel=4
pkgdesc='Official colorful EmojiOne font'
url='https://github.com/emojione/emojione-assets'
arch=('any')
license=('custom')
depends=('fontconfig')
provides=('emoji-font')
replaces=('emojione-fonts')
install="$pkgname.install"
source=("emojione-android-$pkgver.ttf::https://github.com/emojione/emojione-assets/releases/download/$pkgver/emojione-android.ttf"
        '75-emojione.conf'
        "license-free-$pkgver.pdf::https://d1j8pt39hxlh3d.cloudfront.net/license-free.pdf")
sha256sums=('8955dd64a7d1db5d476392c4bfc70e155c5d2caf74a48539b08a818830ebbafb'
            '28a56e95a02135760141d419fa107ce509a3135d05307a2c03ccf4d72d800a79'
            '6d8ace8bc5a09c1fb260708ae7453fa4081fd5549730b3cadcccb8fb22de6ab8')

package() {
    install -Dm644 emojione-android-$pkgver.ttf "$pkgdir/usr/share/fonts/emojione/emojione.ttf"
    install -Dm644 -t "$pkgdir/etc/fonts/conf.avail" 75-emojione.conf
    install -Dm644 license-free-$pkgver.pdf "$pkgdir/usr/share/licenses/$pkgname/LICENSE.pdf"
}

# vim:set ts=4 sw=4 et:
