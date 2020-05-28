# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Contributor: bohoomil <@zoho.com>

pkgname=ttf-iosevka-ibx
pkgver=3.0.0
_rc=rc.1
pkgrel=1
depends=('fontconfig')
pkgdesc="A programmer's typeface"
url="https://github.com/be5invis/Iosevka"
arch=('any')
groups=('infinality-bundle-fonts-extra')
license=('custom:OFL')
source=(https://github.com/be5invis/Iosevka/releases/download/v"$pkgver"-"$_rc"/01-iosevka-"$pkgver"-"$_rc".zip
        45-iosevka.conf
        90-tt-iosevka.conf)
sha1sums=('ad5d9c090a7ef2ec77343eca7d171ba5356c5895'
          '56b9b68799d3945428c5d30958b03898c878eb18'
          '83159b5d820db037c81d10eb75e61f927f4f6fe1')

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
