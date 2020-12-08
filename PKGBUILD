pkgname="ffmt-bin"
fullpkgname="FFXIV_Modding_Tool-linux"
pkgver="0.9.7"
pkgrel="1"
pkgdesc="FFXIV_Modding_Tool (FFMT for short) is a crossplatform commandline interface for Final Fantasy XIV Modding."
arch=('i686' 'x86_64')
options=('staticlibs')
url="https://ffmt.pwd.cat/docs/"
license=("GNU General Public License v3.0")
depends=("dotnet-runtime")
source=("https://github.com/fosspill/FFXIV_Modding_Tool/releases/download/v${pkgver}/FFXIV_Modding_Tool-linux-${pkgver}.zip")
sha256sums=("9623f3684b47d6f18371a8ffe375766559a39095e0e95c0a2ec7d8e1cd40b037")

package() {
    cd $srcdir
    install -dm755 ${fullpkgname}/ffmt "${pkgdir}/opt/ffmt"
    cp -r ${fullpkgname}/ffmt/* "${pkgdir}/opt/ffmt/"
    install -Dm755 ${fullpkgname}/ffmt.sh "${pkgdir}/usr/bin/ffmt"
}
