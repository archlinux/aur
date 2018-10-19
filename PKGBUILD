# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=ttf-emojione
pkgver=4.0.1
pkgrel=1
pkgdesc='Official colorful EmojiOne font'
url='https://github.com/emojione/emojione-assets'
arch=('any')
license=('custom')
depends=('fontconfig')
provides=('ttf-emoji')
replaces=('emojione-fonts')
install="$pkgname.install"
source=("emojione-android-$pkgver.ttf::https://github.com/emojione/emojione-assets/releases/download/$pkgver/emojione-android.ttf"
        '75-emojione.conf'
        'license-free.pdf')
sha256sums=('8955dd64a7d1db5d476392c4bfc70e155c5d2caf74a48539b08a818830ebbafb'
            'ed7cc8c8e8adc03adb7f54211376f2a8e230a2aafe153ef7f9c26e2ea7bb0f63'
            '2898feeb41e03acd1a655ba5ddad0072aac83a014ee184fdcdebc7a66d353650')

package() {
    install -Dm644 emojione-android-$pkgver.ttf "$pkgdir/usr/share/fonts/emojione/emojione.ttf"
    install -Dm644 -t "$pkgdir/etc/fonts/conf.avail" 75-emojione.conf
    install -Dm644 license-free.pdf "$pkgdir/usr/share/licenses/$pkgname/LICENSE.pdf"
}

# vim:set ts=4 sw=4 et:
