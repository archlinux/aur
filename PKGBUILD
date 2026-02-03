# Maintainer: Sadie <zulc22db plus oss at gmail dot com>

pkgname=ttf-petme
pkgver=2020may
pkgrel=2
pkgdesc="KreativeKorp's Ultimate Commodore Font, with VIC-20, PET, CBM2, C64, and C128 typefaces, including 40 and 80 column variations."
arch=('any')
url='https://www.kreativekorp.com/software/fonts/c64/'
license=('custom:relay-fonts-1.2f')
depends=('xorg-fonts-encodings')

makedepends=('wget')
# I get a 406 'Not Accepted' error when using curl to download
# from their website.
DLAGENTS=('https::/usr/bin/wget -O %o %u')

source=('https://www.kreativekorp.com/swdownload/fonts/retro/petme.zip')

package() {
  install -Dm644 "${srcdir}/FreeLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/usr/share/fonts/TTF/"
  for f in $(find "${srcdir}" -type f -name PetMe\*.ttf); do
    install -m644 "$f" "${pkgdir}/usr/share/fonts/TTF/"
  done
}
sha256sums=('5479b901ef7b5f87bbd1a24ca13afe116f56450f97025ac6e28776f5a77edf6e')
