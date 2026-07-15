# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-cli
pkgver=0.2.32
pkgrel=1
pkgdesc="Agentics CLI - the terminal Orb, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('gentics')
options=('!strip' '!debug')
source=("agentics-cli-0.2.32-x86_64.enc::https://software.agentics.co.za/agentics/x86_64/agentics-cli-0.2.32-x86_64.enc")
sha512sums=('72754b3a8180dc48d48ae35e91d0b596d233514772cf895d73aa324c93bbbd7288e67ca8a8650bbc3e3bb8486b1968fd2fa7ff3c5f903f2b4e42f4bbbadfa3d8')

package() {
  install -Dm644 "$srcdir/agentics-cli-0.2.32-x86_64.enc" "$pkgdir/opt/agentics/components/cli/0.2.32/cli-0.2.32-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-cli"
  printf '%s\n' \
    'agentics-cli ships the encrypted Agentics cli component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (gentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install and launch the Agentics launcher to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-cli/README"
}
