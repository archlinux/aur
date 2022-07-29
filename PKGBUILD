# Maintainer: Dominik opyd <d.opyd@oad.earth>

pkgname=forge-server-hooks
pkgver=1.0.0
pkgrel=1
pkgdesc="Pacman hooks related to forge server."
arch=('any')
license=('MIT')
source=('server-mods.hook'
        'server-restart.hook')
md5sums=('b5aa54ebdcc4a84832a39f7e00338c5c'
         'b9534116df8e0fac07e602c7285f0d9f')

provides=(forge-hooks)
replaces=(forge-hooks)
conflicts=(forge-hooks)

package() {
	install -m 0755 -d $pkgdir/usr/share/libalpm/hooks

	install -Dm 0644 $srcdir/server-mods.hook $pkgdir/usr/share/libalpm/hooks/forge-server-mods.hook
  install -Dm 0644 $srcdir/server-restart.hook $pkgdir/usr/share/libalpm/hooks/forge-server-restart.hook

  sed -i 's/$srvname/forge/' $pkgdir/usr/share/libalpm/hooks/forge-server-mods.hook
  sed -i 's/$srvname/forge/' $pkgdir/usr/share/libalpm/hooks/forge-server-restart.hook
}
