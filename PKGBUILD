# Packager: Joseph R. Quinn <quinn.josephr@protonmail.com>
# Maintainer: Joseph R. Quinn <quinn.josephr@protonmail.com>
pkgname=nerd-fonts-inconsolata
pkgver=2.1.1
pkgrel=1
pkgdesc="Patched font Inconsolata from the nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=('MIT')
depends=('fontconfig')
provides=('nerd-fonts-inconsolata')
conflicts=('nerd-fonts-git' 'nerd-fonts-complete')
groups=("nerd-fonts")
source=("https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/Inconsolata.zip"
        "https://github.com/ryanoasis/nerd-fonts/raw/v$pkgver/LICENSE")
b2sums=('c820e37ea8d7ca786db8161e68fced4f393e304f1e4454f72e28761ebba7034d52a11d312f07dcb9e59b3270787271b2395a2f21ac73561054274e63f316cca4'
        'ece38b21e41c31a10260b2a99ea23661a945c11b5edbcb625b0e317be59050cc3bc04d72d4b36f94d89c263fd742d31b55f449057ad54a7e912cd1b472a38a84')

package() {
  find . -iname "*.otf" -not -iname "*Windows Compatible.otf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/OTF/{}" \;
    
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
