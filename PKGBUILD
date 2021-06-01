# Maintainer: JustKidding <jk@vin.ovh>

pkgname=phoenixminer-bin
_pkgbasename=phoenixminer
pkgver=5.6d
pkgrel=1
pkgdesc="The fastest Ethereum/Ethash miner with lowest devfee."
arch=("x86_64")
url="https://bitcointalk.org/index.php?topic=2647654.0"
source=("https://phoenixminer.info/downloads/PhoenixMiner_${pkgver}_Linux.tar.gz")
sha256sums=("9040a1fdc1ba4e5f2387a2d5304f467b2dc2cb5c90595bc4c42d07d015f84e59")
options=('!strip')

package() {
	mkdir -p "$pkgdir/opt/${_pkgbasename}"
	mkdir -p "$pkgdir/usr/bin"

	cd "PhoenixMiner_${pkgver}_Linux/"
	chmod 777 PhoenixMiner

	mv * "$pkgdir/opt/${_pkgbasename}"
	ln -s "/opt/${_pkgbasename}/PhoenixMiner" "$pkgdir/usr/bin/PhoenixMiner"
}

