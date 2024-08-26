# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=conduwuit-bin
pkgdesc="a very cool, featureful fork of Conduit matrix server"
url="https://github.com/girlbossceo/conduwuit"
license=("Apache-2.0")
arch=("x86_64" "aarch64")
pkgver=0.4.5
pkgrel=1
depends=("rocksdb")
source_x86_64=("$pkgname-$pkgver-x86_64::https://github.com/girlbossceo/conduwuit/releases/download/v${pkgver}/static-x86_64-unknown-linux-musl"
		"https://raw.githubusercontent.com/girlbossceo/conduwuit/main/LICENSE"
		"conduwuit.service"
		"conduwuit.toml")
source_aarch64=("$pkgname-$pkgver-aarch64::https://github.com/girlbossceo/conduwuit/releases/download/v${pkgver}/static-aarch64-unknown-linux-musl"
		"https://raw.githubusercontent.com/girlbossceo/conduwuit/main/LICENSE"
		"conduwuit.service"
		"conduwuit.toml")
sha512sums_x86_64=('4d124fd74b6dbcc572bca99bfd5ed67a832a95ecc76a56cad3ae4d234813cb6ce1d64a794605e5c30e2f4f452219972b4f7ca98ec777ebc46b7e263144608568'
                   'b1565558be84b5a7623e158b4ec62ac189b30e7703a3f008d86eb1ab2ecdc88ae5b2ab0d19d5100adfd6ec3dfd6a0a125eaefa0cbdd20049909da53690dc5df6'
                   '563b2fbfb79a018737005a2ec5232afd85b70d463b05e889d092a45cb00038c4cf9f19c9a89a28838d9dc8d7e4178ebd2edf756e1e13c18e9a02b949f7e9c286'
                   '2e8387a6898c2d493052b20c21d01cf9bfcd40ad8100becd6d5efa386b662a73777c4148c9be18e1813274587086311ea57dc50ba3691e64bf8ed3444b7b27f9')
sha512sums_aarch64=('ac55a66b0aafe9c8a93307e4e65eb9f60d20ea2c0579b9e50c1286e96842d5f22734c48647cdc4eced2403dbe04cae0b1f70f92731049935669cf769608d9e3b'
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

