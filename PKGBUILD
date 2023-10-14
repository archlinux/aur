# Maintainer: Stanisław Jasiewicz <stjasiewicz@protonmail.com>
pkgname=nwscript-code
pkgver=1.6.0
pkgrel=1
pkgdesc="Setup for a NWScript IDE assembled from VSC and various development tools"
arch=('any')
url="https://gitlab.com/Taro94/nwscript-code/"
license=('GPL')
depends=('code' 'astyle' 'neverwinter.nim' 'nasher' 'nssnippets-bin' 'nssdefinitions-bin')
optdepends=('wine')
source=('https://gitlab.com/Taro94/nwscript-code/-/archive/1.6.0/nwscript-code-1.6.0.tar.gz')
md5sums=('71f561adf4374b7ba65a9ef42c4d8e35')
options=(!strip)

package() {
	cd nwscript-code-1.6.0
    install -Dm 755 "nwscript-code" -t "$pkgdir/usr/bin"
    install -Dm 755 "nsshotreload" -t "$pkgdir/usr/bin"
    install -Dm 755 "default_config.ini" -t "$pkgdir/usr/share/nwscript-code"
    install -Dm 755 "tasks.json" -t "$pkgdir/usr/share/nwscript-code"
    install -Dm 755 "settings.json" -t "$pkgdir/usr/share/nwscript-code"
    install -Dm 755 "keybindings.json" -t "$pkgdir/usr/share/nwscript-code"
    #install -Dm 755 "extensions" -t "$pkgdir/usr/share/nwscript-code"
    cp -r "extensions" "$pkgdir/usr/share/nwscript-code"    
}
