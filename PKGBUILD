# Maintainer: Daniel Barbosa <dbarbosa0 at gmail dot com>

pkgname=wps-office-vero-pt-br
pkgver=3.2.15
pkgrel=1
pkgdesc="Dicionário de Português do Brasil para WPS Office"
arch=(any)
url="https://pt-br.libreoffice.org/projetos/vero/"
license=(GPL3)
depends=(wps-office)
conflicts=()
source=(https://pt-br.libreoffice.org/assets/Uploads/PT-BR-Documents/VERO/VeroptBR3215AOC.oxt)
sha256sums=('7571a3d8aaa0d5699f8b572d2fc613189876fa4fa87dcbda9a99bd63500210ee')

package() {
       install -d "$pkgdir/usr/lib/office6/dicts/spellcheck/pt_BR"
       echo "[Dictionary]" >> "$pkgdir/usr/lib/office6/dicts/spellcheck/pt_BR/dict.conf"
       echo "DisplayName=Português (Brasil)" >> "$pkgdir/usr/lib/office6/dicts/spellcheck/pt_BR/dict.conf"
  
       install -Dm644 "$srcdir/"pt_BR.dic "$pkgdir/usr/lib/office6/dicts/spellcheck/pt_BR/main.dic"
       install -Dm644 "$srcdir/"pt_BR.aff "$pkgdir/usr/lib/office6/dicts/spellcheck/pt_BR/main.aff"
       install -Dm644 "$srcdir/"README_pt_BR.txt "$pkgdir/usr/lib/office6/dicts/spellcheck/pt_BR/README_pt_BR.txt"
       
}

