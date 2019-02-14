# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=latex-apple-emoji-git
pkgver=r2.cf0ebeb
pkgrel=1
pkgdesc="Style package for directly including color emojis in LaTeX documents with support of color modifiers"
arch=(any)
url="https://github.com/DPDmancul/Apple-Emoji"
license=('GPL2')
depends=('texlive-core')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname}.install"
source=('git://github.com/DPDmancul/Apple-Emoji.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir"/Apple-Emoji
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir"/Apple-Emoji
        mkdir -p $pkgdir/usr/share/texmf-dist/tex/latex/apple_emoji/emoji

        install -m644 emoji/* \
                "$pkgdir/usr/share/texmf-dist/tex/latex/apple_emoji/emoji/"

        install -m644 apple_emoji.sty \
                "$pkgdir/usr/share/texmf-dist/tex/latex/apple_emoji/"
}
