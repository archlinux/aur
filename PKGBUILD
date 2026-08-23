# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-vocal-auth
pkgver=0.1.13
pkgrel=1
pkgdesc="Agentics Vocal Auth - speaker verification, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-vocal-auth-0.1.13-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-vocal-auth-0.1.13-x86_64.enc")
sha512sums=('d0461217ed9d6b046ea6d2e03bfa7fdd94f7f87391d7867a9334c3845dcea08c281a1796019e12fb5b0f03f13e4350b3dc2a58f29a8e295f84da0aa75de4b137')

package() {
  install -Dm644 "$srcdir/agentics-vocal-auth-0.1.13-x86_64.enc" "$pkgdir/opt/agentics/components/vocalauth/0.1.13/vocalauth-0.1.13-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-vocal-auth"
  printf '%s\n' \
    'agentics-vocal-auth ships the encrypted Agentics vocalauth component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-vocal-auth/README"
}
