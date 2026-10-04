# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-cli
pkgver=2.1.112
pkgrel=1
pkgdesc="Agentics CLI - the terminal Orb, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-cli-2.1.112-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-cli-2.1.112-x86_64.enc")
sha512sums=('cfd0c0cbf2b44ac8e9348b69bbe9bd519505a2ef519747a338559fd16b57605b7d87cfb14c32f40a112062d52cc4f2ec2f508b93684fd163623a7ac4e0122f59')

package() {
  install -Dm644 "$srcdir/agentics-cli-2.1.112-x86_64.enc" "$pkgdir/opt/agentics/components/cli/2.1.112/cli-2.1.112-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-cli"
  printf '%s\n' \
    'agentics-cli ships the encrypted Agentics cli component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-cli/README"
}
