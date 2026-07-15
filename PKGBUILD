# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-vocal-auth
pkgver=0.1.11
pkgrel=1
pkgdesc="Agentics Vocal Auth - speaker verification, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('gentics')
options=('!strip' '!debug')
source=("agentics-vocal-auth-0.1.11-x86_64.enc::https://software.agentics.co.za/agentics/x86_64/agentics-vocal-auth-0.1.11-x86_64.enc")
sha512sums=('b045b98cc29cd636f9066a6f1f450157cb34fd52644ef2080d53a11c9a913f07d94fa9a24812408abac58cdc5c239c51bffd26b968144dc2350afdde8af6aa8d')

package() {
  install -Dm644 "$srcdir/agentics-vocal-auth-0.1.11-x86_64.enc" "$pkgdir/opt/agentics/components/vocalauth/0.1.11/vocalauth-0.1.11-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-vocal-auth"
  printf '%s\n' \
    'agentics-vocal-auth ships the encrypted Agentics vocalauth component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (gentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install and launch the Agentics launcher to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-vocal-auth/README"
}
