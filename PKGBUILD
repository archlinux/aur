# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

_port=9001
pkgname=minima-bin
pkgver=0.100.25
pkgrel=1
pkgdesc='A completely decentralized network for information and value transfer'
arch=(any)
url='https://github.com/minima-global/Minima'
license=('Apache-2.0')
depends=('jre-openjdk-headless')
makedepends=('git')
source=(
    'https://github.com/minima-global/Minima/raw/master/jar/minima.jar'
    'minima.default'
    'minima.sysusers'
    'minima.tmpfiles'
    'minima@.service'
)
sha512sums=(
    'ac9691f9142f1384ba07d98e89c222c036b5d40a511e584aa7dafb702353da2b5eb9810cb697231a43c5f198becb342809c2e0a274f385fab7ac296bc76b62d5'
    '6ec21227df4a5bc701ec2f426cbf5083c469b4a0ef2e25ef6546e902fd96c606646cad9307c23e85dcab62ac83773f12d01f08edafa9d6148aebe557c6832588'
    '9bc15d5c757ee895b040f1662e55f51aa9feb8775127665f339c65fccd293f345357fb88282770819b42c5efaf4e065e4454dfc19a5b3a05a0032190cd4934db'
    'b8dfac639077547a717e30822c34f962259afdcb38363f3b2de3ca3510dfe81d690f4b898ac0307ad19fd97ac9f71a4ba70ee03d3b5c4f8c86a0e85533e81933'
    '2c1f9029b23abc008f037029b63e7421660a7a390825f1b66bbe3bbad9e300c9a968956bc51eb3bc0e1331a6704f227a7e82ce3d2533a98441c03d3f9831305e'
)
options=(!strip)
install='minima.install'

package() {
    install -Dm644 minima.default "$pkgdir/etc/default/minima-$_port"
    install -Dm644 minima.sysusers "$pkgdir/usr/lib/sysusers.d/minima.conf"
    install -Dm644 minima.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/minima.conf"
    install -Dm644 minima@.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm755 minima.jar -t "$pkgdir/usr/bin"
}
