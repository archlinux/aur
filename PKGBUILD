# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=nerd-fonts-ibm-plex-mono
_name=IBMPlexMono
pkgver=2.3.0
pkgrel=1
pkgdesc="A Nerd Font patched version of IBM Plex™ Mono"
arch=('any')
url="https://www.nerdfonts.com"
license=('MIT')
provides=('nerd-fonts' 'ttf-font-nerd')
source=("$_name-$pkgver.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/$_name.zip"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v$pkgver/LICENSE")
sha256sums=('129b8bc4fb7f9ad68413932281c5c6c211ca0c5c34dc1987818e6bb181c7996f'
            '1f6ad4edae6479aaace3112ede5279a23284ae54b2a34db66357aef5f64df160')

package() {
  install -d "$pkgdir/usr/share/fonts/TTF"
  find . -iname "*.ttf" -not -iname "*Windows Compatible.ttf" \
    -execdir install -m644 {} "$pkgdir/usr/share/fonts/TTF/{}" \;

  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
