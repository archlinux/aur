# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.304
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.304-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.304-x86_64.enc")
sha512sums=('f5c6f5af9257d5e530887959c8dd23785b4ce736ff6f067cacd837ad32287ab46f2edd5114a8e92f1edb043054ec2512a37d0ea3341c77d9160f414544a0c761')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.304-x86_64.enc" "$pkgdir/opt/agentics/components/agentboard/0.3.304/agentboard-0.3.304-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
