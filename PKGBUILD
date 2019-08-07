# Maintainer: ccat3z <c0ldcat3z@gmail.com>

pkgname=emojify-git
pkgver=2.1.0.r11.gb6e95a0
pkgrel=1
pkgdesc='Emoji on the command line.'
arch=('any')
url='https://github.com/mrowa44/emojify'
depends=('bash')
provides=('emojify')
conflicts=('emojify')
license=('MIT')
source=("${pkgname%-git}::git+https://github.com/mrowa44/emojify.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    install -Dm755 "${srcdir}/${pkgname%-git}/emojify" "${pkgdir}/usr/bin/emojify"
    install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
