# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-vocal-auth
pkgver=0.1.16
pkgrel=1
pkgdesc="Agentics Vocal Auth - speaker verification, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-vocal-auth-0.1.16-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-vocal-auth-0.1.16-x86_64.enc")
sha512sums=('be29544501bf32719ccc4efbd0f00f9dfab038458964972556c57d43ab3576ef0da18b4bea99193db56bbf0c768b938d890e259af31a89fd80fc1ef68909af99')

package() {
  install -Dm644 "$srcdir/agentics-vocal-auth-0.1.16-x86_64.enc" "$pkgdir/opt/agentics/components/vocalauth/0.1.16/vocalauth-0.1.16-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-vocal-auth"
  printf '%s\n' \
    'agentics-vocal-auth ships the encrypted Agentics vocalauth component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-vocal-auth/README"
}
