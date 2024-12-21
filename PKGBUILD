# Maintainer: Luisa Martins <lomartinsdev@gmail.com>

pkgname=vanshot
pkgver=0.1.0
pkgrel=1
pkgdesc="Screenshot tool for Wayland"
arch=('x86_64')
license=('BSD')
depends=('grim' 'slurp' 'swappy')
optdepends=('wl-clipboard: copy to clipboard support'
            'otf-font-awesome: to draw the paint icons properly')

package() {
  mkdir -p ${pkgdir}/usr/bin
  echo "#!/bin/sh" > ${pkgdir}/usr/bin/vanshot
  echo "grim -g \"\$(slurp)\" - | swappy -f -" >> ${pkgdir}/usr/bin/vanshot
  chmod +x ${pkgdir}/usr/bin/vanshot
}
