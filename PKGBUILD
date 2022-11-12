# Maintainer: éclairevoyant
# Contributor: Raven's Iris <liones121 at gmail dot com>

pkgbase=nerd-fonts-victor-mono
pkgname=("ttf-$pkgbase" "otf-$pkgbase")
pkgver=2.2.2
pkgrel=1
pkgdesc='Patched font Victor Mono from nerd-fonts'
arch=('any')
url='https://github.com/ryanoasis/nerd-fonts'
license=('MIT')
provides=('nerd-fonts-victor-mono' 'ttf-font')
conflicts=('nerd-fonts-git' 'nerd-fonts-complete' 'nerd-fonts-complete-mono-glyphs' "$pkgbase")
groups=('nerd-fonts')
source=("$pkgbase-$pkgver.zip::$url/releases/download/v$pkgver/VictorMono.zip")
sha256sums=('21261fbd995653d97ec0879808c2b4fe5cd23dadd43ef4254bd10c30267d8658')

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

package_otf-nerd-fonts-victor-mono() {
  provides+=(
    'otf-nerd-fonts'
  )
  find . \
    -maxdepth 1 \
    -iname "*.otf" \
    -not -iname "*Windows Compatible.otf" \
    -execdir install -Dm644 -t "$pkgdir/usr/share/fonts/$pkgname/" '{}' \;

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

# vim:set sw=2 sts=2 et:
