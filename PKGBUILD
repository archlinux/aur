# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=rspnvpk-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="RSPNVPK is a command line VPK repacking tool for Titanfall 2 (binary release)"
url="https://github.com/taskinoz/RSPNVPK"
license=('MIT')
arch=('x86_64')
provides=("rspnvpk")
conflicts=("rspnvpk")
options=(!strip)
source=("$url/releases/download/v$pkgver/linux-x64.tar.gz"
        "$url/raw/refs/tags/v1.3.1/LICENSE.md")
sha256sums=('75b6e86995cb773757ef35fa057318e98b3246d8d8f6fe9e460807b552b2199d'
            '9aff9a2914771e7f46eb5fb942b2c1dfb7afd8f9de58f1fcd0b5e30476b5b00e')

package() {
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/rspnvpk"
  install -Dm644 RSPNVPK.pdb -t "$pkgdir/opt/RSPNVPK"
  install -Dm755 RSPNVPK "$pkgdir/opt/RSPNVPK/rspnvpk"
  install -d "$pkgdir/usr/bin"
  ln -s "$pkgdir/opt/RSPNVPK/rspnvpk" "$pkgdir/usr/bin"
}
