# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.283
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.283-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.283-x86_64.enc")
sha512sums=('6c407acf459690f7a74e8b137b3b0c7b9082a034db3ebb5e1a97312eac31a3117ea59cfdc6b3eedc47e8632d83fae889c206889e3e65d7cf41ae159315515671')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.283-x86_64.enc" "$pkgdir/opt/agentics/components/agentboard/0.3.283/agentboard-0.3.283-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
