# Maintainer: sukanka <su975853527 AT gmail dot com>

pkgname=citespace
pkgver=5.8.R3
pkgrel=1
pkgdesc="A widely used tool for visual exploration of scientific literature."
arch=('any')
url="http://cluster.cis.drexel.edu/~cchen/citespace/"
license=('unknown')
depends=('java-runtime')
source=("${pkgname}-${pkgver}.zip::https://sourceforge.net/projects/citespace/files/5.8.R3%20%28Oct%203%2C%202021%20-%20June%2030%2C%202022%29/${pkgver}.zip/download"
"$pkgname".desktop
"$pkgname".sh
"$pkgname".png
)
sha256sums=('8d534ba008d088d2176faa741f9d8eca6ed563b49912c38450de9df3a2d11da3'
            '5256f6866d830da93fd5439d45ae8b35f45806d19e7c86830e8d2db07fa5c83d'
            'ceb5509f461f99a70c2f7cde28f4cd6316de0208e975739b2cf53bbd749ed678'
            '8d9414070356bc200815e0c6e1f40bdd6775c1fff0931dd0ed9b7aec09598eb3')


package(){
    cd $srcdir
    install -Dm644  *.jar    ${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar
    install -Dm644  "$pkgname".desktop -t      ${pkgdir}/usr/share/applications
    install -Dm644  ${pkgname}.png     -t \
        ${pkgdir}/usr/share/icons/hicolor/512x512/apps
    install -Dm755  "$pkgname".sh              ${pkgdir}/usr/bin/$pkgname
}
