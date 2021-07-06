# Maintainer: BTD Master <btdmaster at disroot dot org>
pkgname=syphon-bin
_pkgname=syphon
pkgver=0.1.10
pkgrel=1
pkgdesc="Privacy-centric Matrix client"
arch=('x86_64')
url="https://github.com/syphon-org/syphon"
license=('AGPL3')
depends=('gtk3' 'libsecret')
provides=('syphon')
source=("https://github.com/syphon-org/syphon/releases/download/$pkgver/$_pkgname.linux.x64.tar.gz")
sha256sums=('ff35294d21cbae817835c81596a759e99457197776091e85a74ef3bed437e581')

package() {
    install -d ${pkgdir}/opt/${_pkgname}
    install -d ${pkgdir}/usr/bin
    cp -r ${srcdir}/{data,lib,syphon} ${pkgdir}/opt/${_pkgname}
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/bin/sh
exec /opt/${_pkgname}/${_pkgname} "\$@"
END
}
