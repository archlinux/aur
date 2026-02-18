# Maintainer: Huang Yifan <yifan0610 at foxmail dot com>

pkgname='catppuccin-thunderbird-themes'
pkgver='1.0.0'
pkgrel=1
pkgdesc='Thunderbird catppuccin themes'
arch=('any')
url='https://github.com/catppuccin/thunderbird'
license=('MIT')
makedepends=('git')
depends=('thunderbird')
source=("git+$url")
sha256sums=('SKIP')

package() {
  install -Ddm755 $pkgdir/usr/share/licenses/$pkgname
  install -m644 $srcdir/thunderbird/LICENSE $pkgdir/usr/share/licenses/$pkgname

  install -Ddm755 $pkgdir/usr/lib/thunderbird/extensions

  for flavor in 'latte' 'frappe' 'macchiato' 'mocha'; do
    for accent in 'blue' 'green' 'maroon' 'peach' 'red' 'sapphire' 'teal' 'flamingo' 'lavender' 'mauve' 'pink' 'rosewater' 'sky' 'yellow'; do
      install -m644 "$srcdir/thunderbird/themes/$flavor/$flavor-$accent.xpi" "$pkgdir/usr/lib/thunderbird/extensions/catppuccin-$flavor-$accent.xpi"
    done
  done
}
