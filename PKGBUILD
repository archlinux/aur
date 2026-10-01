# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-vocal-auth
pkgver=0.1.14
pkgrel=1
pkgdesc="Agentics Vocal Auth - speaker verification, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-vocal-auth-0.1.14-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-vocal-auth-0.1.14-x86_64.enc")
sha512sums=('2e1a96287a4909decfe7acde7f115afd84b5b58eff425baa6a78312fa6e9d8d89de6b7d149b457ad379d675fe48055dc119494703948c5f1aa31457ce6f22b24')

package() {
  install -Dm644 "$srcdir/agentics-vocal-auth-0.1.14-x86_64.enc" "$pkgdir/opt/agentics/components/vocalauth/0.1.14/vocalauth-0.1.14-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-vocal-auth"
  printf '%s\n' \
    'agentics-vocal-auth ships the encrypted Agentics vocalauth component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-vocal-auth/README"
}
