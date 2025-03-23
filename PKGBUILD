# Mantainer: nikbott <viniciusreyeskury at proton dot me>
# Contributor: orumin <dev@orum.in>

pkgname=ttf-mikachan
pkgver=9.1
pkgrel=1
pkgdesc="Handwritten Japanese font family with a cute, playful vibe"
arch=('any')
url="https://www.mia-lab.com/mf/"
license=('custom')
_dlpath="https://deb.debian.org/debian/pool/non-free/f/fonts-mikachan/fonts-mikachan_$pkgver.orig"
# Sources:
# 1. Mikachan      : fixed width
# 2. Mikachan-P    : proportional
# 3. Mikachan-PB   : proportional and bold
# 4. Mikachan-PS   : proportional, some fonts are smaller than Kanji - Hiragana,
#                    Katakana, Arabic numerals and Symbols
# 5. Mikachan-puchi: petit and petit bold
source=("$pkgname-$pkgver.tar.bz2::${_dlpath}.tar.bz2"
        "$pkgname-P-$pkgver.tar.bz2::${_dlpath}-mikachanfont-p.tar.bz2"
        "$pkgname-PB-$pkgver.tar.bz2::${_dlpath}-mikachanfont-pb.tar.bz2"
        "$pkgname-PS-$pkgver.tar.bz2::${_dlpath}-mikachanfont-ps.tar.bz2"
	"$pkgname-puchi-$pkgver.tar.bz2::${_dlpath}-mikachan-puchi.tar.bz2")
sha256sums=('6a62974ed786e1653d8ef0ae5efc3a8d9de31504c43f633f12640badd3f77f99'
            '016c6b23e93d4cca7e473cf24d6270089ebb87b6c3e31ff0110b7a0386df3027'
            '59398abdb381daafdc7db849dd817c60ac247d6c50692f4ae573b46fabfb6673'
            '48f2b1485561f59d1865b600f8275e29364bd2e5d28ca3ef92c34a81d43ab746'
            '1ab309214d6b5efc819447ca15a3d445e10ff7d87be299faad39f3142fbcce55')

package() {
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" "$pkgname-$pkgver".orig/fonts/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" mikachanfont-p/fonts/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" mikachanfont-pb/fonts/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" mikachanfont-ps/fonts/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" mikachan-puchi/*.ttc
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname-$pkgver".orig/COPYRIGHT
}
