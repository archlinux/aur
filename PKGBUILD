# Contributor: <darehanl@gmail.com>
# Contributor: atie H. <atie.at.matrix@gmail.com>

pkgname=ttf-nanumgothic_coding
pkgver=2.0
pkgrel=1
pkgdesc="Nanum series fixed width TrueType fonts"
arch=('any')
url="http://dev.naver.com/projects/nanumfont"
license=('OFL')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=('http://dev.naver.com/frs/download.php/441/NanumGothicCoding-2.0.zip')
md5sums=('6214a5844454c96faeac9a60539c7daf')

build() {
    cd $pkgdir

    install -d -m 755 usr/share/fonts/TTF || return 1

    # Use hack to rename non-utf8 filenames to english
    install -m 644 ${srcdir}/*Bold.ttf usr/share/fonts/TTF/NanumGothicCoding-Bold.ttf || return 1
    rm ${srcdir}/*Bold.ttf
    install -m 644 ${srcdir}/*.ttf usr/share/fonts/TTF/NanumGothicCoding.ttf || return 1
}
