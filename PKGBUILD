# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.298
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.298-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.298-x86_64.enc")
sha512sums=('d46ea71ceba9b1703346817ff2232686a8e15365bc924c88f5c6712387f4dfbf99576bba3aa3c89593dbd52b9dff4ed1fe2431015eb642decbbfcba39b5bfba4')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.298-x86_64.enc" "$pkgdir/opt/agentics/components/agentboard/0.3.298/agentboard-0.3.298-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
