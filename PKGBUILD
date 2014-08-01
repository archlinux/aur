# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: Andreas Zwinkau
# Contributor: rabyte <rabyte__gmail>
# Contributor: Stefan Husmann < stefan-husmann@t-online.de>

pkgname=ttf-liberation-sans-narrow
pkgver=1.07.4
pkgrel=1
pkgdesc="Red Hat's Liberation Sans Narrow"
arch=('any')
license=('custom' 'GPL2')
url='https://www.redhat.com/promo/fonts/'
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
optdepends=('ttf-liberation: Main liberation fonts')
provides=('ttf-font')
install=ttf.install
source=("https://fedorahosted.org/releases/l/i/liberation-fonts/liberation-fonts-ttf-$pkgver.tar.gz"
        30-0-liberation-sans-narrow.conf)
sha256sums=('61a7e2b6742a43c73e8762cdfeaf6dfcf9abdd2cfa0b099a9854d69bc4cfee5c'
            'b9da42411e2035d87a366c7de9f85004e681a2fc4ea7dd82a17e7a1ce9715908')

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
