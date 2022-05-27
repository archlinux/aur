# Maintainer: silverhikari <kerrickethan@gmail.com>
pkgname=qasarbeach-bin
pkgver=129g
pkgrel=2
pkgdesc="a recreation of the Fairlight CMI 2x by Adam Strange"
arch=('x86_64')
url="https://adamstrange.itch.io/qasarbeach/"
depends=("libpulse" "libxi" "openal")
license=('nonfree')
provides=('qasarbeach')
source=("QasarBeach.zip::local://QasarBeach.zip" "${pkgname%-bin}${pkgver}.tar.gz::local://${pkgname%-bin}${pkgver}.tar.gz" "cookbook.zip::local://cookbook.zip" "Guide.pdf.zip::local://Guide.pdf.zip" "QasarBeach.png" "QasarBeach.desktop")
install=qasarbeach.install
sha256sums=("SKIP" "SKIP" "SKIP" "SKIP" "SKIP" "SKIP")

package() {

cd "${srcdir}/qasarbeach"
install -dm777 "${pkgdir}/opt/qasarbeach"
install -Dm755 "qasarbeach" "${pkgdir}/opt/qasarbeach/qasarbeach"
install -d "${pkgdir}/usr/bin/"
ln -s "/opt/qasarbeach/qasarbeach" "${pkgdir}/usr/bin/Qasarbeach"
cp -r "assets" "${pkgdir}/opt/qasarbeach"
chmod -R "755" "${pkgdir}/opt/qasarbeach/assets"

cd "${srcdir}"

cp -r "QasarBeach" "${pkgdir}/opt/qasarbeach"
chmod -R "755" "${pkgdir}/opt/qasarbeach/QasarBeach"
cp -r "cookbook" "${pkgdir}/opt/qasarbeach"

install -Dm755 "cookbook.pdf" "${pkgdir}/usr/share/doc/qasarbeach/cookbook.pdf"

install -Dm755 "Guide.pdf" "${pkgdir}/usr/share/doc/qasarbeach/Guide.pdf"

install -Dm755 "QasarBeach.png" "${pkgdir}/usr/share/pixmaps/QasarBeach.png"

install -Dm755 "QasarBeach.desktop" "${pkgdir}/usr/share/applications/QasarBeach.desktop"
}
