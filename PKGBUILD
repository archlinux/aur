# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=nerd-fonts-ibm-plex-mono
_name=IBMPlexMono
pkgver=2.2.1
pkgrel=1
pkgdesc="A Nerd Font patched version of IBM Plex™ Mono"
arch=('any')
url="https://www.nerdfonts.com"
license=('MIT')
provides=('nerd-fonts' 'ttf-font-nerd')
conflicts=('nerd-fonts' 'nerd-fonts-complete')
install="$pkgname.install"
source=("$_name-$pkgver.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/$_name.zip"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v$pkgver/LICENSE")
sha256sums=('56f87ab8dfd3070105006794954fbeb5f2adcddba342231622b8f1eec6589101'
            '245b522abb5aba0d8e84898bf6d5e95102620637626106bfd0061189a2370360')

package() {
  install -d "$pkgdir/usr/share/fonts/TTF"
  find . -iname "*.ttf" -not -iname "*Windows Compatible.ttf" \
    -execdir install -m644 {} "$pkgdir/usr/share/fonts/TTF/{}" \;

  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
