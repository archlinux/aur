# Maintainer : Sven Karsten Greiner <sven@sammyshp.de>

# With this patch Adobe Flash Player won't automatically exit full-screen mode
# anymore when another window gets the focus (this situation is only possible
# when using multiple physical or virtual screens).

pkgname=flashplugin-focusfix
pkgver=1.0
pkgrel=1
epoch=1
pkgdesc='Multi-monitor full-screen fix for Adobe Flash Player'
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('flashplugin')
source=('hook.install'
        'hook.remove')
md5sums=('aea76c93d5045e39191cdc3b5cb4e719'
         '0283b277ac11a8ddcf5d0140883840b3')

package () {
    install -D -m 644 hook.install "$pkgdir/usr/share/libalpm/hooks/70-flashplugin-focusfix-install.hook"
    install -D -m 644 hook.remove "$pkgdir/usr/share/libalpm/hooks/70-flashplugin-focusfix-remove.hook"
}
