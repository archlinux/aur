# Maintainer: éclairevoyant
# Contributor: Raven's Iris <liones121 at gmail dot com>

pkgbase=nerd-fonts-victor-mono
pkgname=("ttf-$pkgbase")
pkgver=2.3.0
pkgrel=1
pkgdesc='Patched font Victor Mono from nerd-fonts'
arch=('any')
url='https://github.com/ryanoasis/nerd-fonts'
license=('MIT')
provides=('nerd-fonts-victor-mono' 'ttf-font')
conflicts=('nerd-fonts-git' 'nerd-fonts-complete' 'nerd-fonts-complete-mono-glyphs' "$pkgbase")
groups=('nerd-fonts')
source=("$pkgbase-$pkgver.zip::$url/releases/download/v$pkgver/VictorMono.zip")
b2sums=('6a052d04869bc8d9575a2ad736b8063b8cf45caa45345862a7b7aedb461c095cb689ef29d2ed5ed6c4cf9bf012bd90c4d8b17b9a88a32542b7bee8b92e920107')

package_ttf-nerd-fonts-victor-mono() {
  provides+=(
    'ttf-font-nerd'
    'ttf-nerd-font'
    'ttf-nerd-fonts'
    'ttf-nerd-fonts-symbols'
    'ttf-nerd-fonts-symbols-mono'
  )
  find . \
    -maxdepth 1 \
    -iname "*.ttf" \
    -not -iname "*Windows Compatible.ttf" \
    -execdir install -Dm644 -t "$pkgdir/usr/share/fonts/$pkgname/" '{}' \;

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
