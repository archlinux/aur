# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.292
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.292-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.292-x86_64.enc")
sha512sums=('94d7a0914d16518a0f216960f7f2ad569f40bc14123549c931aaa9c4c6e87966795a2ff4384dc0a8040903d62189e2cd292a54856bd1e3fccc6134fa6c358a34')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.292-x86_64.enc" "$pkgdir/opt/agentics/components/agentboard/0.3.292/agentboard-0.3.292-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
