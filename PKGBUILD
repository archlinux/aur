# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=ttf-emojione-alt
pkgver=4.0.1
pkgrel=1
pkgdesc='Official colorful EmojiOne font, alternative PG version'
url='https://github.com/emojione/emojione-assets'
arch=('any')
license=('custom')
depends=('fontconfig')
conflicts=('ttf-emojione') # Because right now font families are identical
provides=('ttf-emoji' 'ttf-emojione')
install="$pkgname.install"
source=("emojione-android-alt-$pkgver.ttf::https://github.com/emojione/emojione-assets/releases/download/$pkgver/emojione-android-alt.ttf"
        '75-emojione.conf'
        'license-free.pdf')
sha256sums=('77f08d736d08d8ff90809df1bf6d1a143d46e1214fcf7de6275a520f7a0057ee'
            'ed7cc8c8e8adc03adb7f54211376f2a8e230a2aafe153ef7f9c26e2ea7bb0f63'
            '2898feeb41e03acd1a655ba5ddad0072aac83a014ee184fdcdebc7a66d353650')

package() {
    install -Dm644 emojione-android-alt-$pkgver.ttf "$pkgdir/usr/share/fonts/emojione/emojione-alt.ttf"
    install -Dm644 -t "$pkgdir/etc/fonts/conf.avail" 75-emojione.conf
    install -Dm644 license-free.pdf "$pkgdir/usr/share/licenses/$pkgname/LICENSE.pdf"
}

# vim:set ts=4 sw=4 et:
