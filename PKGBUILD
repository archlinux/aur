# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Contributor: bohoomil <@zoho.com>

pkgname=ttf-iosevka-ibx
pkgver=3.5.0
pkgrel=1
pkgdesc="A programmer's typeface"
url="https://github.com/be5invis/Iosevka"
arch=('any')
groups=('infinality-bundle-fonts-extra')
license=('OFL')
source=("$url/releases/download/v$pkgver/pkg-iosevka-$pkgver.zip"
        45-iosevka.conf
        90-tt-iosevka.conf)
sha256sums=('c2c56c2600490571d796ba4f655bb116a8334420bee65991c7d59d83cbccd4ff'
            '6e6526bdb8c5128e27edcb554f6d7663ca18eeb3f9e076ea938a51d883115ffe'
            'afa1120b3ca7885158ac6ab59f5d22b9ceb7147f46880cd3f76a2560959ded3b')

package(){
  install -m755 -d "$pkgdir"/usr/share/fonts/"$pkgname"
  install -m644 "$srcdir"/ttf/*.ttf "$pkgdir"/usr/share/fonts/"$pkgname"

  install -D -m644 ../45-iosevka.conf \
    "$pkgdir"/etc/fonts/conf.avail/45-iosevka.conf
  install -D -m644 ../90-tt-iosevka.conf \
    "$pkgdir"/etc/fonts/conf.avail/90-tt-iosevka.conf

  install -m755 -d "$pkgdir"/etc/fonts/conf.d
  cd "$pkgdir"/etc/fonts/conf.d
  ln -s ../conf.avail/45-iosevka.conf .
  ln -s ../conf.avail/90-tt-iosevka.conf .
}
