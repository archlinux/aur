# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.291
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.291-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.291-x86_64.enc")
sha512sums=('0a404a35cabafa4b3bf147b56a285aa5971510d7caf8fbbea89648f6a0d9d4a4146d9137ed0c25b525f04f7b4f5ccf843a7a412d592d5475ec9a02172b5f5157')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.291-x86_64.enc" "$pkgdir/opt/agentics/components/agentboard/0.3.291/agentboard-0.3.291-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
