# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=conduwuit-bin
pkgdesc="a very cool, featureful fork of Conduit matrix server"
url="https://github.com/girlbossceo/conduwuit"
license=("Apache-2.0")
arch=("x86_64" "aarch64")
pkgver=0.4.2
pkgrel=1
makedepends=("rust" "cargo" "git" "clang")
depends=("gcc-libs" "glibc" "liburing")
source_x86_64=("$pkgname-$pkgver-x86_64::https://github.com/girlbossceo/conduwuit/releases/download/v${pkgver}/static-x86_64-unknown-linux-musl"
		"https://raw.githubusercontent.com/girlbossceo/conduwuit/main/LICENSE"
		"conduwuit.service"
		"conduwuit.toml")
source_aarch64=("$pkgname-$pkgver-aarch64::https://github.com/girlbossceo/conduwuit/releases/download/v${pkgver}/static-aarch64-unknown-linux-musl"
		"https://raw.githubusercontent.com/girlbossceo/conduwuit/main/LICENSE"
		"conduwuit.service"
		"conduwuit.toml")
sha512sums_x86_64=('89e2372c044d5a96cdfff139601e2a7948fb8c57bcfb51d6c80dc4de4289a4a91aeb6f2fcb4284e73dca553bd97ca060b6894d737fdc33a76b0f2da2815e3ad0'
                   'b1565558be84b5a7623e158b4ec62ac189b30e7703a3f008d86eb1ab2ecdc88ae5b2ab0d19d5100adfd6ec3dfd6a0a125eaefa0cbdd20049909da53690dc5df6'
                   '563b2fbfb79a018737005a2ec5232afd85b70d463b05e889d092a45cb00038c4cf9f19c9a89a28838d9dc8d7e4178ebd2edf756e1e13c18e9a02b949f7e9c286'
                   '2e8387a6898c2d493052b20c21d01cf9bfcd40ad8100becd6d5efa386b662a73777c4148c9be18e1813274587086311ea57dc50ba3691e64bf8ed3444b7b27f9')
sha512sums_aarch64=('1aa95dfdda5fc3e6c0fcf65f067a661506fbeec04cbf6fb0595585f2a80f5f7c317de796e49e91799883575212265dc4005c100b74e050f771a773536b0c8048'
                    'b1565558be84b5a7623e158b4ec62ac189b30e7703a3f008d86eb1ab2ecdc88ae5b2ab0d19d5100adfd6ec3dfd6a0a125eaefa0cbdd20049909da53690dc5df6'
                    '563b2fbfb79a018737005a2ec5232afd85b70d463b05e889d092a45cb00038c4cf9f19c9a89a28838d9dc8d7e4178ebd2edf756e1e13c18e9a02b949f7e9c286'
                    '2e8387a6898c2d493052b20c21d01cf9bfcd40ad8100becd6d5efa386b662a73777c4148c9be18e1813274587086311ea57dc50ba3691e64bf8ed3444b7b27f9')
provides=("conduwuit")
options=(!lto)
backup=("etc/conduwuit.toml")

package() {
	install -Dm755 "${srcdir}/$pkgname-$pkgver-$CARCH" "${pkgdir}/usr/bin/conduwuit"
	install -Dm644 "${srcdir}/conduwuit.service" "$pkgdir/usr/lib/systemd/system/conduwuit.service"
	install -Dm644 "${srcdir}/conduwuit.toml" "${pkgdir}/etc/conduwuit.toml"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

