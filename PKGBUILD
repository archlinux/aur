# Maintainer: Lev Levitsky <levlev@mail.ru>
pkgname=msgfplus
pkgver=2018.01.30
pkgrel=1
pkgdesc="MS/MS database search tool"
arch=('any')
url="https://github.com/sangtaekim/msgfplus"
license=('custom')
depends=('java-environment')
source=("https://github.com/sangtaekim/msgfplus/releases/download/v${pkgver}/v${pkgver//./}.zip"
		"msgf+"
		"mzid2tsv"
        "https://raw.githubusercontent.com/sangtaekim/msgfplus/master/LICENSE.txt")
md5sums=('8ed7345ced1abf41e632afd60831a55a'
         'c43c6581b373266171c3930c3718eb9c'
         'c860b9c30b74dae43de2d3933a405ac1'
         'SKIP')

package() {
    cd "$srcdir"
    install -D MSGFPlus.jar "${pkgdir}/usr/share/java/${pkgname}/MSGFPlus.jar"
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    cp -r doc/examples "${pkgdir}/usr/share/${pkgname}/"
    install -D msgf+ "${pkgdir}/usr/bin/msgf+"
    install -D mzid2tsv "${pkgdir}/usr/bin/mzid2tsv"
    install -D LICENSE.txt -t "${pkgdir}/usr/share/licenses/msgfplus/"
}
