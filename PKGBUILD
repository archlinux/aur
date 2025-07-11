# Maintainer: Saghm Rossi <aur@saghm.com>
pkgname=normm-bin
pkgver=0.4.2
pkgrel=1
provides=('normm')
pkgdesc="A cross-platform mod manager for Oblivion Remastered"
arch=('x86_64')
url="https://github.com/TheNamlessGuy/oblivion-remaster-mod-manager"
source=("namless-oblivion-remaster-mod-manager.$arch::https://github.com/TheNamlessGuy/oblivion-remaster-mod-manager/releases/download/v$pkgver/namless-oblivion-remaster-mod-manager.x86_64"
	"normm")

sha512sums=('db81a3896a6709e4ded20552c89e11cf2d69b0621d12c1701be82d6887d4a119d5987c8c7de3204b6477064e77ffa2c6b873f459f1381190db78c97aa2e8a685'
            'SKIP')

prepare() {
    chmod +x namless-oblivion-remaster-mod-manager.$arch
}

package() {
    install -Dm755 "namless-oblivion-remaster-mod-manager.$arch" "${pkgdir}/usr/bin/namless-oblivion-remaster-mod-manager.$arch"
    install -Dm755 "normm" "${pkgdir}/usr/bin/normm"
}
