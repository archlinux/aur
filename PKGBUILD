# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=ttf-emojione
pkgver=3.1.2
pkgrel=1
pkgdesc="Colored emoji font from EmojiOne project."
url="https://github.com/emojione/emojione"
arch=(any)
license=(custom)
depends=('fontconfig')
conflicts=('noto-fonts-emoji' 'ttf-emojione-color')
replaces=('emojione-fonts')
source=("https://github.com/emojione/emojione-assets/releases/download/${pkgver}/emojione-android.ttf"
        "70-emojione-color.conf"
        "license-free.pdf")
sha256sums=('6efb1a43873876bcc9476562e20cf8d875eca20bab456d83a580f46a39321139'
            'a059c1fa2070d7eb778d8a6048f975d76e343da9e7d946780ccd03d0a83e2cad'
            '2898feeb41e03acd1a655ba5ddad0072aac83a014ee184fdcdebc7a66d353650')

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -d "$pkgdir/etc/fonts/"{conf.d,conf.avail}
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 emojione-android.ttf
  install -t "$pkgdir/etc/fonts/conf.avail/" -m644 70-emojione-color.conf
  ln -sf ../conf.avail/70-emojione-color.conf $pkgdir/etc/fonts/conf.d/70-emojione-color.conf
  install -Dm644 license-free.pdf "$pkgdir/usr/share/licenses/$pkgname/LICENSE.pdf" 
}

# vim:set ts=2 sw=2 et:
