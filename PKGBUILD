# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: bslackr <brendan at vastactive dot com>
# Contributor: Firmicus <firmicus āt gmx dōt net>

pkgname=ttf-sil-lateef
_fname=LateefGR
pkgver=1.200
pkgrel=4
pkgdesc='Arabic script font for Sindhi and other languages of southern Asia'
arch=('any')
url='https://software.sil.org/lateef/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=("http://software.sil.org/downloads/r/lateef/$_fname-$pkgver.zip")
sha256sums=('ef6c6b4b4cb8d8502c78efc43cb99d29f391e6cb9eba1b133a661ffda3ddc7e1')

package() {
    cd "$_fname-$pkgver"
    find -type f -name "$_fname*.ttf" -execdir \
        install -Dm644 {} -t "$pkgdir/usr/share/fonts/TTF" \;
    install -Dm644 OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
