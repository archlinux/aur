# Maintainer: Lev Levitsky <levlev@mail.ru>
pkgname=msgfplus
pkgver=2020.03.14
pkgrel=1
pkgdesc="MS/MS database search tool"
arch=('any')
url="https://github.com/MSGFPlus/msgfplus"
license=('custom')
depends=('java-environment')
source=("https://github.com/MSGFPlus/msgfplus/releases/download/v${pkgver}/MSGFPlus_v${pkgver//./}.zip"
		"msgf+"
		"mzid2tsv"
        "scoringParamGen"
        "https://raw.githubusercontent.com/sangtaekim/msgfplus/master/LICENSE.txt")
md5sums=('7f17ed5b1e0f8dc73c72f823df1b343d'
         'c43c6581b373266171c3930c3718eb9c'
         'c860b9c30b74dae43de2d3933a405ac1'
         '315d84069d6333a83599aa93b782eb5c'
         '88b22e0922010401ea88bcf03e3bb5d2')

package() {
    cd "$srcdir"
    install -D MSGFPlus.jar "${pkgdir}/usr/share/java/${pkgname}/MSGFPlus.jar"
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    cp -r Docs/Examples "${pkgdir}/usr/share/${pkgname}/"
    install -D msgf+ "${pkgdir}/usr/bin/msgf+"
    install -D mzid2tsv "${pkgdir}/usr/bin/mzid2tsv"
    install -D scoringParamGen "${pkgdir}/usr/bin/scoringParamGen"
    install -D LICENSE.txt -t "${pkgdir}/usr/share/licenses/msgfplus/"
}
