# Packager: fontmaker <5cdc15ca-0343-49ad-b082-65be967d32fa@anonaddy.me>
# Maintainer: fontmaker <5cdc15ca-0343-49ad-b082-65be967d32fa@anonaddy.me>
pkgname=nerd-fonts-inconsolatalgc
pkgver=2.1.0
pkgrel=2
pkgdesc="Patched font Inconsolata LGC from the nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=('MIT')
depends=('fontconfig')
provides=('nerd-fonts-inconsolatalgc')
conflicts=('nerd-fonts-git' 'nerd-fonts-complete')
groups=("nerd-fonts")
source=("https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/inconsolatalgc.zip"
        "https://github.com/ryanoasis/nerd-fonts/raw/v$pkgver/LICENSE")
sha512sums=('6937dcb94a1778e23d633bd135e3a86f98e7a6c0b4b6192eaf7e19cdcc439ecf9772701fb6a9bd5dd65c45e9e716428f88a9075255edb3001ce43705f84a377a'
            '95712651fb58ad5f5ee1b796b1891e5cb6c62532699c08d3cd9255df46c10336faa170b4ec5a920be44d2cba68ab7726907c800e4a9b0060483437569cfe6fd3')

package() {
	find . -iname "*.ttf" -not -iname "*Windows Compatible.ttf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/TTF/{}" \;

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
