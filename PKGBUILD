# Maintainer: Ludvig Holtze <ludvighg1999 at gmail dot com>

pkgname=quake3-fortress
pkgver=2.20
pkgrel=1
pkgdesc="A modification for Quake III Arena featuring class-based gameplay"
url="https://web.archive.org/web/20080826070240/http://www.q3f.com:80/"
license=('custom')
arch=('any')
depends=('quake3')
source=('https://mirrorservice.org/sites/quakeunity.com/modifications/q3fortress/q3f_220_full.zip')
sha256sums=('6c1105ee783c4acd76f6beeabf5ca30519974da0782e210c3505d083900b0072')

package() {
    # Create destination directory
    install -d "${pkgdir}/opt/quake3/"

    # Install Q3F files
    cp -r "${srcdir}/q3f2" "${pkgdir}/opt/quake3/"

    # Remove unneccessary files
    cd "${pkgdir}/opt/quake3/q3f2/"
    rm -r "Custom HuD's" "Sample Configs" howtos
    rm FAQ.URL "Play Q3F.bat" "Q3F Servers.URL" "Start Q3F Server.bat" "Support (Forums).URL" q3f.com.URL
}
