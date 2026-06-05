pkgname=dota-config-sync-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Aplicación gráfica para sincronizar configuraciones locales y userdata entre cuentas de Dota 2"
arch=('x86_64')
url="https://github.com/jaguar-17/dota_config_sync"
license=('MIT')
depends=('gtk3' 'glib2')
provides=('dota-config-sync')
conflicts=('dota-config-sync')
source=("${url}/releases/download/v${pkgver}/dota-config-sync-linux-x64.tar.gz")
sha256sums=('3c4c32249b2c5d516e4e634fd3bf24f4debfca87b0da3c9ec80324042f7db09a')

package() {
  cd "bundle" 
  
  install -d "${pkgdir}/opt/dota-config-sync"
  cp -r * "${pkgdir}/opt/dota-config-sync/"
  
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/dota-config-sync/dota_config_sync" "${pkgdir}/usr/bin/dota-config-sync"
}
