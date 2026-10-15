# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.311
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.311-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.311-x86_64.enc")
sha512sums=('92d0cdc3a368ee7890fa2549338c799c51015e114ba2e0c7372d9affe9d59faa9190ce01aaccbde7f156b9adb0764b66a1ec1a78e1d4d52b6b9a220a2769e3e9')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.311-x86_64.enc" "$pkgdir/opt/agentics/components/agentboard/0.3.311/agentboard-0.3.311-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
