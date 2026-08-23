# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-cli
pkgver=2.1.106
pkgrel=1
pkgdesc="Agentics CLI - the terminal Orb, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-cli-2.1.106-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-cli-2.1.106-x86_64.enc")
sha512sums=('20399a1a30e7168e9696e052cc5ed3cf3b478255105075b260f83ca61a8bb095920199a1bce5bceddbc131b4208a74ca0d349877bd591a634fa7a4a359b164a3')

package() {
  install -Dm644 "$srcdir/agentics-cli-2.1.106-x86_64.enc" "$pkgdir/opt/agentics/components/cli/2.1.106/cli-2.1.106-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-cli"
  printf '%s\n' \
    'agentics-cli ships the encrypted Agentics cli component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-cli/README"
}
