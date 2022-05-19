# Maintainer: JustKidding <jk@vin.ovh>

pkgname=phoenixminer-bin
_pkgbasename=phoenixminer
pkgver=6.2c
pkgrel=1
pkgdesc="The fastest Ethereum/Ethash miner with lowest devfee."
arch=("x86_64")
url="https://bitcointalk.org/index.php?topic=2647654.0"
source=("https://phoenixminer.info/downloads/PhoenixMiner_${pkgver}_Linux.tar.gz"{,.asc})
sha256sums=('dad2f42237269b8f98932e9dcf45d12e30d3f694e52ada01e2c891a348636319'
            'SKIP')
validpgpkeys=("F9403D7EAE2AC5F4C361015E654C5927EE163067") # Phoenix Devs <pdevs@example.com>
options=(!strip)

package() {
  mkdir -p "$pkgdir/opt/${_pkgbasename}"
  mkdir -p "$pkgdir/usr/bin"

  cd "PhoenixMiner_${pkgver}_Linux/"
  chmod 777 PhoenixMiner

  mv * "$pkgdir/opt/${_pkgbasename}"
  ln -s "/opt/${_pkgbasename}/PhoenixMiner" "$pkgdir/usr/bin/PhoenixMiner"
}

# vim:set ts=2 sw=2 et:
