# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: Andreas Zwinkau
# Contributor: rabyte <rabyte__gmail>
# Contributor: Stefan Husmann < stefan-husmann@t-online.de>

pkgname=ttf-liberation-sans-narrow
pkgver=1.07.3
pkgrel=1
pkgdesc="Red Hat's Liberation Sans Narrow"
arch=('any')
license=('custom' 'GPL2')
url='https://www.redhat.com/promo/fonts/'
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
optdepends=('ttf-liberation: Main liberation fonts')
makedepends=('fontforge')
provides=('ttf-font')
install=ttf.install
source=("https://fedorahosted.org/releases/l/i/liberation-fonts/liberation-fonts-ttf-$pkgver.tar.gz"
        30-0-liberation-sans-narrow.conf)
md5sums=('b3174b11c2b6a341f5c99b31088bd67b'
         'c99ab610c6c6f1616417ff67f26624df')

package() {
  cd "$srcdir/liberation-fonts-ttf-$pkgver"

  install -d "$pkgdir/usr/share/fonts/TTF/"
  install -m644 LiberationSansNarrow*.ttf "$pkgdir/usr/share/fonts/TTF/"

  # install fontconfig files
  install -Dm0644 ../30-0-liberation-sans-narrow.conf "$pkgdir/etc/fonts/conf.avail/30-$pkgname-sans.conf"

  # install license
  install -Dm644 "${srcdir}/liberation-fonts-ttf-${pkgver}/License.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
