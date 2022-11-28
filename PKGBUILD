# Maintainer: Luiz Renato <ruizlenato@proton.me>

pkgname=kamyroll-tauri
pkgver=1.0.4
pkgrel=1
pkgdesc='Kamyroll-Tauri is a computer client allowing you to view your favorite anime thanks to Kamyroll.'
arch=('x86_64')
url='https://github.com/kamyroll/Kamyroll-Tauri'
license=('custom')
depends=('libayatana-appindicator')

source=("$url/releases/download/v$pkgver/kamyroll_${pkgver}_amd64.deb")
sha512sums=('d4a618098d7f3cccfcb64024c7ba9d05fea0fd275c4d4a53759de0a35ed7b1c7d2854824cfb8d84b3484780565dcdee882bc066fb6375b9ea7474415ba7467c4')

package() {
	tar xf data.tar.gz -C "${pkgdir}"
    install -Dv "${pkgdir}"/usr/bin/{main,kamyroll} -t "${pkgdir}"/usr/bin/kamyroll-tauri/
    rm "${pkgdir}"/usr/bin/{main,kamyroll}
    ln -rTsf "${pkgdir}"/usr/bin/kamyroll-tauri/kamyroll "${pkgdir}"/usr/bin/kamyroll
    chmod +x "${pkgdir}"/usr/bin/kamyroll
    install -Dm644 "${pkgdir}"/usr/share/icons/hicolor/256x256@2/apps/kamyroll.png "${pkgdir}"/usr/share/pixmaps/kamyroll.png
    rm -rf "${pkgdir}"/usr/share/icons
}