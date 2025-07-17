# Maintainer: Saghm Rossi <aur@saghm.com>
pkgname=normm-bin
pkgver=0.5.0
pkgrel=1
provides=('normm')
pkgdesc="A cross-platform mod manager for Oblivion Remastered"
arch=('x86_64')
url="https://github.com/TheNamlessGuy/oblivion-remaster-mod-manager"
source=("namless-oblivion-remaster-mod-manager.$arch::https://github.com/TheNamlessGuy/oblivion-remaster-mod-manager/releases/download/v$pkgver/namless-oblivion-remaster-mod-manager.x86_64"
	"normm"
	"NORMM.desktop")

sha512sums=('db81a3896a6709e4ded20552c89e11cf2d69b0621d12c1701be82d6887d4a119d5987c8c7de3204b6477064e77ffa2c6b873f459f1381190db78c97aa2e8a685'
            '542636ce6395e6ba68ae589d8f238bf0419381a31703d1b7bfa010daa63e363341865166a13e4671effaa9d1ff3a294c28539d6bdd6c2592ebd55fa8ac296a30'
            '7348d11fed953af22f4582900f8f263294b5ad7e45a257779b1ce313959989b5ce6b2da457ee414477c3befa9a4d504593d19ff0e8287add5f3bbf23b2f5fcc8')

prepare() {
    chmod +x namless-oblivion-remaster-mod-manager.$arch
}

package() {
    install -Dm755 "namless-oblivion-remaster-mod-manager.$arch" "${pkgdir}/usr/bin/namless-oblivion-remaster-mod-manager.$arch"
    install -Dm755 "normm" "${pkgdir}/usr/bin/normm"
    install -Dm755 "NORMM.desktop" "${pkgdir}/usr/share/applications/NORMM.desktop"
}
