# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.310
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.310-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.310-x86_64.enc")
sha512sums=('d101a15a8ba0c3129f01e2106e3d8e377c549615d1f76c62f4bfa2f753c927abaad1fa106463f795bb22c836dc784813ca362275b2e2cdbafb2bc420de1bee92')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.310-x86_64.enc" "$pkgdir/opt/agentics/components/agentboard/0.3.310/agentboard-0.3.310-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
