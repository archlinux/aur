# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: GI_Jack <iamjacksemail@hackermail.com>

pkgname=putty-freedesktop
pkgver=2
pkgrel=1
pkgdesc="Icon and .desktop file for Putty"
arch=('any')
license=('MIT')
url='http://www.chiark.greenend.org.uk/~sgtatham/putty/'
depends=('putty')
optdepends=('sudo: privilege escalation for putty'
            'gksu: privilege escalation for putty'
            'xterm: privilege escalation for putty'
            'kdebase-runtime: privilege escalation for putty')
source=('putty.desktop' 'putty.png' 'putty.xpm'
        'putty-root.desktop' 'su-to-putty.sh')
sha256sums=('d33543cfd081f9a9fef3f5de0663b92142312d3d345faa559a771c7ef60dca69'
            '50cd4712011ea5124fc999298e1ccb51e10ba4f6448e434dc5e46b80c6d9b18a'
            'd65139883171ed0119d9778ff4a89e6a8151a5ae97fcf8dc7cafb59df424377f'
            '359c41850691bea8bdeb3331f9fa3abb2ff8871f1a236943a89c70a57ce82b09'
            '2e32d76276675f2f5ed2ea996d95776ec3c7776ea04ba3fe96a28300ba8a3144')

package() {
  install -Dm755 su-to-putty.sh \
              "${pkgdir}/usr/share/${pkgname}/su-to-putty.sh"
  install -Dm644 putty.desktop \
             "${pkgdir}/usr/share/applications/putty.desktop"
  install -m644  putty-root.desktop \
             "${pkgdir}/usr/share/applications/putty-root.desktop"
  install -Dm644 putty.png \
             "${pkgdir}/usr/share/pixmaps/putty.png"
  install -m644  putty.xpm \
             "${pkgdir}/usr/share/pixmaps/putty.xpm"
}
