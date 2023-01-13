# Maintainer: Kamyroll_dev <>
# Contributor: Kamyroll <>

pkgname=kamyroll-tauri-dev
pkgver=1.0.5_beta+8a5c01f
pkgrel=1
pkgdesc='Kamyroll-Tauri is a computer client allowing you to view your favorite anime from well known platforms.'
arch=('x86_64')
url='https://github.com/kamyroll/Kamyroll-Tauri'
license=('custom')
depends=('libayatana-appindicator')

source=("$url/releases/download/v${pkgver//_/-}/kamyroll_${pkgver%_*}_amd64.deb")
sha512sums=('c07d25de68c2b2e261199696c0ad77fc23dc44dc7036205e2f196feb030e232b0a0a1a72ec7f136ae757d3cb30278521da20d814cc8ea03b10a0bd7d015996b0')

package() {
	tar xf data.tar.gz -C "${pkgdir}"
    install -Dv "${pkgdir}"/usr/bin/{main,kamyroll} -t "${pkgdir}"/usr/bin/kamyroll-tauri/
    rm "${pkgdir}"/usr/bin/{main,kamyroll}
    ln -rTsf "${pkgdir}"/usr/bin/kamyroll-tauri/kamyroll "${pkgdir}"/usr/bin/kamyroll
    chmod +x "${pkgdir}"/usr/bin/kamyroll
    install -Dm644 "${pkgdir}"/usr/share/icons/hicolor/256x256@2/apps/kamyroll.png "${pkgdir}"/usr/share/pixmaps/kamyroll.png
    rm -rf "${pkgdir}"/usr/share/icons
}