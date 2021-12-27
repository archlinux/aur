# Maintainer: Bouteiller a2n Alan <a2n.dev@pm.me>
# Contributor: FivEawE

pkgname=dracut-numlock
pkgver=1.0.1
pkgrel=1
pkgdesc="A dracut module which enables numlock in the early boot"
arch=('any')
url="https://github.com/bouteillerAlan/dracut-numlock"
license=('MIT')
source=("https://github.com/bouteillerAlan/${pkgname}/releases/download/${pkgname}-v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
depends=("sh")
sha256sums=('74e9b5e4d58acff8835c4fd4503618afc035f5b29b02794be2463f8018eed39f')

package() {
  cd "${pkgname}-v${pkgver}"
  install -Dm 644 50numlock/module-setup.sh "${pkgdir}"/usr/lib/dracut/modules.d/50numlock/module-setup.sh
  install -Dm 644 50numlock/numlock.sh "${pkgdir}"/usr/lib/dracut/modules.d/50numlock/numlock.sh
  install -D LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

