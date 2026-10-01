# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-astt
pkgver=0.1.6
pkgrel=1
pkgdesc="Agentics ASTT - the on-device speech engine, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-astt-0.1.6-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-astt-0.1.6-x86_64.enc")
sha512sums=('ae9e03a248e178998b4097df4386f6e92b7eb6f4b8723a37318651dcc03967e316fb7575deca7c45643c7ed31af1bd7d3d9b12366c3d217297731e005e6a51d5')

package() {
  install -Dm644 "$srcdir/agentics-astt-0.1.6-x86_64.enc" "$pkgdir/opt/agentics/components/speech/0.1.6/speech-0.1.6-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-astt"
  printf '%s\n' \
    'agentics-astt ships the encrypted Agentics speech component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-astt/README"
}
