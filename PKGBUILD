# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.321
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.321-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.321-x86_64.enc")
sha512sums=('50c274af8bf1f6e796bf181215e12e9c60cf8fd57b24115524f06723aa97084a22c44be645b3ef85b80341af620f511f78eb9b74904f0df44a5bf5d7098e3d76')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.321-x86_64.enc" "$pkgdir/opt/agentics/components/agentboard/0.3.321/agentboard-0.3.321-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
