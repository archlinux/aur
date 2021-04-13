pkgname="ffmt-bin"
fullpkgname="FFXIV_Modding_Tool-linux"
pkgver="0.9.9"
pkgrel="1"
pkgdesc="FFXIV_Modding_Tool (FFMT for short) is a crossplatform commandline interface for Final Fantasy XIV Modding."
arch=('i686' 'x86_64')
options=('staticlibs')
url="https://ffmt.pwd.cat/docs/"
license=("GNU General Public License v3.0")
depends=("dotnet-runtime")
source=("https://github.com/fosspill/FFXIV_Modding_Tool/releases/download/v${pkgver}/FFXIV_Modding_Tool-linux-${pkgver}.zip")
sha256sums=("5460acd4156269342a349ee2f5c2bd9b8245330c1bb89656680ec7d0274ff423")

package() {
    cd $srcdir
    install -dm755 ${fullpkgname}/ffmt "${pkgdir}/opt/ffmt"
    cp -r ${fullpkgname}/ffmt/* "${pkgdir}/opt/ffmt/"
    install -Dm755 ${fullpkgname}/ffmt.sh "${pkgdir}/usr/bin/ffmt"
}
