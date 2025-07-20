# Maintainer: Saghm Rossi <aur@saghm.com>
pkgname=normm-bin
pkgver=0.5.1
pkgrel=1
provides=('normm')
pkgdesc="A cross-platform mod manager for Oblivion Remastered"
arch=('x86_64')
url="https://github.com/TheNamlessGuy/oblivion-remaster-mod-manager"
source=("namless-oblivion-remaster-mod-manager.$arch::https://github.com/TheNamlessGuy/oblivion-remaster-mod-manager/releases/download/v$pkgver/namless-oblivion-remaster-mod-manager.x86_64"
	"normm"
	"NORMM.desktop")

sha512sums=('36f79ddb675d393684560139a117ff6c65586b4b837afbba332a2059486f927ade2ccf85c4b643cf88eb81b4dbb0e7c74476280e739f1fee222442d16a384fc9'
            '4275fdcce36b5f922c49e2d1cd5d2f299607dd7567fadcb059106db7951fa52807d7865863bfcd734a2d937653c6e72acd948ba191b900586eb651e68e473f5e'
            '7348d11fed953af22f4582900f8f263294b5ad7e45a257779b1ce313959989b5ce6b2da457ee414477c3befa9a4d504593d19ff0e8287add5f3bbf23b2f5fcc8')

prepare() {
    chmod +x namless-oblivion-remaster-mod-manager.$arch
    mv namless-oblivion-remaster-mod-manager.$arch namless-oblivion-remaster-mod-manager
}

package() {
    install -Dm755 "namless-oblivion-remaster-mod-manager" "${pkgdir}/usr/bin/namless-oblivion-remaster-mod-manager"
    install -Dm755 "normm" "${pkgdir}/usr/bin/normm"
    install -Dm755 "NORMM.desktop" "${pkgdir}/usr/share/applications/NORMM.desktop"
}
