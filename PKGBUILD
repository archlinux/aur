pkgname=dota-config-sync-bin
pkgver=1.0.0
pkgrel=5
pkgdesc="Aplicación gráfica para sincronizar configuraciones locales y userdata entre cuentas de Dota 2"
arch=('x86_64')
url="https://github.com/jaguar-17/dota_config_sync"
license=('MIT')
depends=('gtk3' 'glib2')
provides=('dota-config-sync')
conflicts=('dota-config-sync')
source=("${url}/releases/download/v${pkgver}/dota-config-sync-linux-x64.tar.gz"
        "com.example.dota_config_sync.desktop"
        "https://raw.githubusercontent.com/jaguar-17/dota_config_sync/main/linux/icono.png")
sha256sums=('3c4c32249b2c5d516e4e634fd3bf24f4debfca87b0da3c9ec80324042f7db09a'
            '610a9e156e91421da88e69d5c23624ca222c036a755ad8362b5c5a7b437cde18'
            '5ac2e541e36c7d4bf82e7a4b5ed7d16cb27fd4810086f4990bf3980ab33ccf3a')

package() {
  cd "bundle" 
  install -d "${pkgdir}/opt/dota-config-sync"
  cp -r * "${pkgdir}/opt/dota-config-sync/"
  
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/dota-config-sync/dota_config_sync" "${pkgdir}/usr/bin/dota-config-sync"
  
  install -Dm644 "${srcdir}/com.example.dota_config_sync.desktop" "${pkgdir}/usr/share/applications/com.example.dota_config_sync.desktop"
  
  install -Dm644 "${srcdir}/icono.png" "${pkgdir}/usr/share/pixmaps/dota-config-sync.png"
}
