# Contributor: <darehanl@gmail.com>
# Contributor: atie H. <atie.at.matrix@gmail.com>

pkgname=ttf-nanumgothic_coding
pkgver=2.0.1
pkgrel=1
pkgdesc="Nanum series fixed width TrueType fonts"
arch=('any')
url="http://dev.naver.com/projects/nanumfont"
license=('OFL')
depends=('fontconfig' 'xorg-font-utils')
provides=('ttf-font')
install=ttf.install
source=('http://dev.naver.com/frs/download.php/441/NanumGothicCoding-2.0.zip')
md5sums=('6214a5844454c96faeac9a60539c7daf')

package() {
    install -dm 755 ${pkgdir}/usr/share/fonts/TTF

    # Use hack to rename non-utf8 filenames to english
    install -m 644 -T ${srcdir}/*Bold.ttf ${pkgdir}/usr/share/fonts/TTF/NanumGothicCoding-Bold.ttf
    rm ${srcdir}/*Bold.ttf
    install -m 644 -T ${srcdir}/*.ttf ${pkgdir}/usr/share/fonts/TTF/NanumGothicCoding.ttf
}

