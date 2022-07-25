# Maintainer: Dominik opyd <d.opyd@oad.earth>
pkgbase=minecraft-hooks
pkgname=(forge-hooks quilt-hooks fabric-hooks)
pkgver=1.0.1
pkgrel=1
pkgdesc="Pacman hooks related to minecraft servers."
arch=('any')
license=('MIT')
source=('server-mods.hook'
        'server-restart.hook')
md5sums=('b5aa54ebdcc4a84832a39f7e00338c5c'
         'b9534116df8e0fac07e602c7285f0d9f')

package_forge-hooks() {
	install -m 0755 -d $pkgdir/usr/share/libalpm/hooks

	install -Dm 0644 $srcdir/server-mods.hook $pkgdir/usr/share/libalpm/hooks/forge-mods.hook
  install -Dm 0644 $srcdir/server-restart.hook $pkgdir/usr/share/libalpm/hooks/forge-restart.hook

  sed -i 's/$srvname/forge/' $pkgdir/usr/share/libalpm/hooks/forge-mods.hook
  sed -i 's/$srvname/forge/' $pkgdir/usr/share/libalpm/hooks/forge-restart.hook
}

package_quilt-hooks() {
	install -m 0755 -d $pkgdir/usr/share/libalpm/hooks

	install -Dm 0644 $srcdir/server-mods.hook $pkgdir/usr/share/libalpm/hooks/quilt-mods.hook
	install -Dm 0644 $srcdir/server-restart.hook $pkgdir/usr/share/libalpm/hooks/quilt-restart.hook

  sed -i 's/$srvname/quilt/' $pkgdir/usr/share/libalpm/hooks/quilt-mods.hook
  sed -i 's/$srvname/quilt/' $pkgdir/usr/share/libalpm/hooks/quilt-restart.hook
}

package_fabric-hooks() {
	install -m 0755 -d $pkgdir/usr/share/libalpm/hooks

	install -Dm 0644 $srcdir/server-mods.hook $pkgdir/usr/share/libalpm/hooks/fabric-mods.hook
	install -Dm 0644 $srcdir/server-restart.hook $pkgdir/usr/share/libalpm/hooks/fabric-restart.hook

  sed -i 's/$srvname/fabric/' $pkgdir/usr/share/libalpm/hooks/fabric-mods.hook
  sed -i 's/$srvname/fabric/' $pkgdir/usr/share/libalpm/hooks/fabric-restart.hook
}
