# Maintainer: Azure Zeng <weedycn at outlook.com>

pkgname=iputils-ping6-symlink
pkgver=1.0.0
pkgrel=1
pkgdesc='Provide ping4 and ping6 symbolic links for compatibility purpose'
arch=('any')
url='https://github.com/iputils/iputils'
license=('Apache License 2.0')
depends=('iputils')
provides=('ping4' 'ping6')
#conflicts=()

package() {
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/man/man8"

    local _curFile
    for _curFile in ping4 ping6; do
        ln -s ping "$pkgdir/usr/bin/$_curFile"
        ln -s ping.8.gz "$pkgdir/usr/share/man/man8/$_curFile".8.gz
    done
}
