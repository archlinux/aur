# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-cli
pkgver=2.1.115
pkgrel=1
pkgdesc="Agentics CLI - the terminal Orb, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-cli-2.1.115-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-cli-2.1.115-x86_64.enc")
sha512sums=('7be1e2f5398f847a049dc8d18c926ae44c3ff779a0eab35d1167ad0c66d8fb7938bc15831f91b0955bae873064415a3c8296e06b4d7d0bcb3d0c1f6ee6adb040')

package() {
  install -Dm644 "$srcdir/agentics-cli-2.1.115-x86_64.enc" "$pkgdir/opt/agentics/components/cli/2.1.115/cli-2.1.115-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-cli"
  printf '%s\n' \
    'agentics-cli ships the encrypted Agentics cli component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-cli/README"
}
