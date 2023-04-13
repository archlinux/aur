# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=owncast-bin
_pkg=owncast
pkgver=0.0.13
pkgrel=1
pkgdesc="Take control over your live stream video by running it yourself. Streaming + chat out of the box."
url="https://github.com/owncast/owncast"
arch=('x86_64')
license=('MIT')
provides=('owncast')
conflicts=('owncast' 'owncast-git')
source=("$url/releases/download/v$pkgver/$_pkg-$pkgver-linux-64bit.zip"
        "https://raw.githubusercontent.com/$_pkg/$_pkg/develop/LICENSE"
        "apache.conf"
        "nginx.conf"
        "owncast.service"
        "sysusers.conf"
        "tmpfiles.conf")
sha512sums=('1728a323861eafb3e22b572905b01e18b9f78323908d12fb1355fee8473d4dfec0a4de90cac26006b5fc5d1edda38617173fcf7f071b0b04f918000740920afc'
            '1beecdcb25bac0fc9284f8db21112eb6f62236f973101b1f64208097da6006d8b2340bc1394938b99f5203fd069f382d2c5ed2d202d6cc510537bce7de89839d'
            'd0b33a529584f0d9a8c86039318aa3cc961eead6ce84c1066c97c0b263efec99f60d5a6f8662833db59a242a3ec4b8b1c3f6155ddd9cfdb16e599b355a8fa44b'
            'e243a7d6bd1d8f369d2f7044348acdb3f8547eff6794fe6ff9e3433489993a9895359e572f18f3780d3d28d443842c11c7cafa2afbb8ae4ef2e5b48869bf93c6'
            '145761756acacd7f988e56b7a855988fb1270d3dbd8ead7bb23fe87a04a22b5319db301974632126d967801ba7ae5a60e123839d50821a273701de0568bd2c4f'
            'f756b7d92e96cf2ce21abe259aeaf7f3877297a0734f3f62fde12c62e8a85649e8af4ec5c927a6ea3f76e2cdfb46b7ae96559b42b08061db4a9a570f23aaa03f'
            '384fe460576c09e38cfa739b266576ba6af859e8fb638fe8a97cbf7f84c1afb77dbdcf4e29760333e658fe09e8322bca28924cc7762331d72ee31ac486497428')

package() {
  install -Dm755 $_pkg "$pkgdir"/usr/bin/$_pkg
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkg/LICENSE"
  install -Dm644 "$srcdir/owncast.service" "$pkgdir/usr/lib/systemd/system/owncast.service"
  install -Dm644 "$srcdir/apache.conf" "$pkgdir/usr/share/$_pkg/example-apache.conf"
  install -Dm644 "$srcdir/nginx.conf" "$pkgdir/usr/share/$_pkg/example-nginx.conf"
  install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/owncast.conf"
  install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/owncast.conf"
}
