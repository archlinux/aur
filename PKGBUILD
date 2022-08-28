# Packager: Joseph R. Quinn <quinn.josephr@protonmail.com>
# Maintainer: Joseph R. Quinn <quinn.josephr@protonmail.com>
pkgname=nerd-fonts-noto
pkgver=2.2.0
pkgrel=1
pkgdesc="Patched font Noto from the nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=('MIT')
depends=('fontconfig')
provides=('nerd-fonts-noto')
conflicts=('nerd-fonts-git' 'nerd-fonts-complete' 'nerd-fonts-noto-sans-mono'
  'nerd-fonts-noto-sans-regular-complete')
groups=("nerd-fonts")
source=("https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/Noto.zip"
        "https://github.com/ryanoasis/nerd-fonts/raw/v$pkgver/LICENSE")
b2sums=('7dc65d9c0ec49e8b4812b283ea380fa657d53079b863f8a02f363d428cd244ce348c0046aa549e8bfd9e48e1cbb0be6dcc90590b2d580c58fccb6066fb5a75c3'
        'ece38b21e41c31a10260b2a99ea23661a945c11b5edbcb625b0e317be59050cc3bc04d72d4b36f94d89c263fd742d31b55f449057ad54a7e912cd1b472a38a84')

package() {
  find . -iname "*.ttf" -not -iname "*Windows Compatible.ttf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/TTF/{}" \;
    
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
