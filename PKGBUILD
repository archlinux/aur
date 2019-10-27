# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: Andreas Zwinkau
# Contributor: rabyte <rabyte__gmail>
# Contributor: Stefan Husmann < stefan-husmann@t-online.de>
# Package Repository: https://github.com/mij-aur-packages/ttf-liberation-sans-narrow

pkgname=ttf-liberation-sans-narrow
pkgver=1.07.6
pkgrel=1
pkgdesc="Red Hat's Liberation Sans Narrow"
arch=('any')
license=('custom' 'GPL2')
url='https://github.com/liberationfonts/liberation-sans-narrow'
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
optdepends=('ttf-liberation: Main liberation fonts')
provides=('ttf-font')
source=("https://github.com/liberationfonts/liberation-sans-narrow/files/2579431/liberation-narrow-fonts-ttf-${pkgver}.tar.gz"
        30-0-liberation-sans-narrow.conf)
sha256sums=('8879d89b5ff7b506c9fc28efc31a5c0b954bbe9333e66e5283d27d20a8519ea3'
            'b9da42411e2035d87a366c7de9f85004e681a2fc4ea7dd82a17e7a1ce9715908')

package() {
  cd "$srcdir/liberation-narrow-fonts-ttf-$pkgver"

  install -d "$pkgdir/usr/share/fonts/TTF/"
  install -m644 LiberationSansNarrow*.ttf "$pkgdir/usr/share/fonts/TTF/"

  # install fontconfig files
  install -Dm0644 ../30-0-liberation-sans-narrow.conf "$pkgdir/etc/fonts/conf.avail/30-$pkgname-sans.conf"

  # install license
  install -Dm644 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
