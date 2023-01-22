# Maintainer: Kamyroll_dev <>
# Contributor: Kamyroll <>

pkgname=kamyroll-tauri-dev
pkgver=1.0.5_beta+e891c9b
pkgrel=1
pkgdesc='Kamyroll-Tauri is a computer client allowing you to view your favorite anime from well known platforms.'
arch=('x86_64')
url='https://github.com/kamyroll/Kamyroll-Tauri'
license=('custom')
depends=('libayatana-appindicator')

source=("$url/releases/download/v${pkgver//_/-}/kamyroll_${pkgver%_*}_amd64.deb")
sha512sums=('e97ab50662f882495f9e7f1366b371590fedd374916cf11b04f60331b65c0d3fa82574fd45ccf5996431fc7fdfcc6db76d23f8bc2038785adb010f85e8643672')

package() {
	tar xf data.tar.gz -C "${pkgdir}"
    install -Dv "${pkgdir}"/usr/bin/{main,kamyroll} -t "${pkgdir}"/usr/bin/kamyroll-tauri/
    rm "${pkgdir}"/usr/bin/{main,kamyroll}
    ln -rTsf "${pkgdir}"/usr/bin/kamyroll-tauri/kamyroll "${pkgdir}"/usr/bin/kamyroll
    chmod +x "${pkgdir}"/usr/bin/kamyroll
    install -Dm644 "${pkgdir}"/usr/share/icons/hicolor/256x256@2/apps/kamyroll.png "${pkgdir}"/usr/share/pixmaps/kamyroll.png
    rm -rf "${pkgdir}"/usr/share/icons
}