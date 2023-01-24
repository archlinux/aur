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

source=("$url/releases/download/v${pkgver//_/-}/kamyroll_${pkgver%_*}_amd64.deb")
sha512sums=('09a6f4bb8c7178c6b1be676be6de642a3373a54526b4e76aa486ef807b07ad4dec5d8c90d0083d5511fc89b06e66cadfcfda24f82ebacd5ded43302a9bea496f')

package() {
	tar xf data.tar.gz -C "${pkgdir}"
    install -Dv "${pkgdir}"/usr/bin/{main,kamyroll} -t "${pkgdir}"/usr/bin/kamyroll-tauri/
    rm "${pkgdir}"/usr/bin/{main,kamyroll}
    ln -rTsf "${pkgdir}"/usr/bin/kamyroll-tauri/kamyroll "${pkgdir}"/usr/bin/kamyroll
    chmod +x "${pkgdir}"/usr/bin/kamyroll
    install -Dm644 "${pkgdir}"/usr/share/icons/hicolor/256x256@2/apps/kamyroll.png "${pkgdir}"/usr/share/pixmaps/kamyroll.png
    rm -rf "${pkgdir}"/usr/share/icons
}