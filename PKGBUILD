# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=emojione-fonts
pkgver=3.1.1
pkgrel=1
pkgdesc="Colored emoji fonts from EmojiOne project."
url="https://github.com/emojione/emojione"
arch=(any)
license=(custom)
depends=('fontconfig')
optdepends=('cairo-coloredemoji: (Recommended) display color emoji in all GTK+ apps.')
provides=("$pkgname" 'ttf-emojione')
conflicts=("$pkgname" 'noto-fonts-emoji' 'ttf-emojione')
source=("https://github.com/emojione/emojione/blob/master/extras/fonts/emojione-android.ttf"
        "https://github.com/emojione/emojione/blob/master/extras/fonts/emojione-svg.otf"
        "https://github.com/emojione/emojione/blob/master/extras/fonts/emojione-svg.woff"
        "https://github.com/emojione/emojione/blob/master/extras/fonts/emojione-svg.woff2"
        "70-emojione-color.conf"
        "license-free.pdf")
sha256sums=('6efb1a43873876bcc9476562e20cf8d875eca20bab456d83a580f46a39321139'
            'c9e4fe12f2d11e6a5f4d351ecfcf6dc513873fd77e8090fefe91cd230a4e3c6b'
            '3e0cb4d82f6398c17e378bba4c9eb879af71ef85969a7a0f5f8d1c83fef799fb'
            'ce592217c59d2199f1453c703176313a8a63e78e82da27b2762b17341a4f95c7'
            'b2914972168b71bfa8959c76db52b38b4bee9bf8f0e9288e48718551f28b238c'
            '2898feeb41e03acd1a655ba5ddad0072aac83a014ee184fdcdebc7a66d353650')

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -d "$pkgdir/etc/fonts/"{conf.d,conf.avail}
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 emojione-*.{ttf,otf,woff*}
  install -Dm644 70-emojione-color.conf "$pkgdir/etc/fonts/conf.avail/70-emojione-color.conf"
  ln -sf ../conf.avail/70-emojione-color.conf $pkgdir/etc/fonts/conf.d/70-emojione-color.conf
  install -Dm644 license-free.pdf "$pkgdir/usr/share/licenses/$pkgname/LICENSE.pdf"  
}

# vim:set ts=2 sw=2 et:
