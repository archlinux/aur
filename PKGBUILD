# Maintainer: Kamyroll_dev <>
# Contributor: Kamyroll <>

pkgname=kamyroll-tauri-dev
pkgver=1.0.5_beta+272d341
pkgrel=1
pkgdesc='Kamyroll-Tauri is a computer client allowing you to view your favorite anime from well known platforms.'
arch=('x86_64')
url='https://github.com/kamyroll/Kamyroll-Tauri'
license=('custom')
depends=('libayatana-appindicator')

source=("$url/releases/download/v${pkgver//_/-}/kamyroll_${pkgver%_*}_amd64-debug.deb")
sha512sums=('ded1b8cc09bfdf7aace5ca53a43b201e4f9b9726c24ccbab85b79f3cfbf286a8bbeb5aefedc6ccef344d2ab360b7152ec531e58f802298cd4568174ce060bc2c')

package() {
	tar xf data.tar.gz -C "${pkgdir}"
    install -Dv "${pkgdir}"/usr/bin/{main,kamyroll} -t "${pkgdir}"/usr/bin/kamyroll-tauri/
    rm "${pkgdir}"/usr/bin/{main,kamyroll}
    ln -rTsf "${pkgdir}"/usr/bin/kamyroll-tauri/kamyroll "${pkgdir}"/usr/bin/kamyroll
    chmod +x "${pkgdir}"/usr/bin/kamyroll
    install -Dm644 "${pkgdir}"/usr/share/icons/hicolor/256x256@2/apps/kamyroll.png "${pkgdir}"/usr/share/pixmaps/kamyroll.png
    rm -rf "${pkgdir}"/usr/share/icons
}