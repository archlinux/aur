# Maintainer: Dawid Weglarz <dawid.weglarz95@gmail.com>

pkgname=bat-asus-battery-bin
pkgver=1.1
pkgrel=1
pkgdesc="Replicate the functionality of the ASUS Battery Health Charging on Windows which aims prolong the battery's life-span"
arch=("x86_64")
url="https://github.com/tshakalekholoane/bat"
license=('MIT')
provides=('bat-asus-battery')
source=(${pkgname/-bin/}::"https://github.com/tshakalekholoane/bat/releases/download/${pkgver}/bat"
    "${pkgname/-bin/}.1"::"https://raw.githubusercontent.com/tshakalekholoane/bat/${pkgver}/bat.1"
    )
sha256sums=('0f6292d619cc485025b004d6ee3e1cb259b7917d074bdaaa4362deb8192d438d'
    'SKIP'
    )

package() {
    install -Dm755 "${srcdir}/bat-asus-battery" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/bat-asus-battery.1" -t "${pkgdir}/usr/share/man/man1/"
}
