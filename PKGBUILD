# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=nerd-fonts-jetbrains-mono
_name=JetBrainsMono
pkgver=2.2.2
pkgrel=1
pkgdesc="A Nerd Font patched version of JetBrains Mono"
arch=('any')
url="https://www.nerdfonts.com"
license=('MIT')
provides=('nerd-fonts' 'ttf-font-nerd')
conflicts=('nerd-fonts' 'nerd-fonts-complete')
source=("$_name-$pkgver.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/$_name.zip"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v$pkgver/LICENSE")
sha256sums=('8b9b6c58081d179ecd50839a6b211dbd24b61e66d87715860129b6138982ee7b'
            '245b522abb5aba0d8e84898bf6d5e95102620637626106bfd0061189a2370360')

package() {
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  find . -iname "*.ttf" -not -iname "*Windows Compatible.ttf" \
    -execdir install -m644 {} "$pkgdir/usr/share/fonts/TTF/{}" \;

  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
