# Contributor: orumin <dev@orum.in>

pkgname=ttf-kibitaki-git
_gitname=Kibitaki
pkgver=20140710
pkgrel=1
pkgdesc="Japanese TrueType font obtained by mixing M+ and Source Code Pro"
arch=('any')
url="http://kibitaki.lindwurm.biz/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
source=('git+https://github.com/Koruri/Kibitaki.git')
md5sums=('SKIP')
install=ttf.install

pkgver() {
    date +%Y%m%d
}

package() {
    cd "${srcdir}/${_gitname}"

    install -dm755 "${pkgdir}/usr/share/fonts/TTF"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"

    install -m644 ./*.ttf "${pkgdir}/usr/share/fonts/TTF"
    install -m644 ./LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}"
}
