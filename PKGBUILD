# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=virt-domain-by-addr
pkgdesc="A basic server written in shell answering with a libvirt domain name when given a mac"
pkgver=1.0.1
pkgrel=1
arch=('any')
url='https://github.com/vbouchaud/aur/tree/main/virt-domain-by-addr'
license=('MIT')
depends=(
    netcat
    libvirt
)

source=(
    LICENSE::https://bouchaud.org/misc/MIT.txt
    server.sh
    virt-domain-by-addr-sysusers.conf
    virt-domain-by-addr.service
)

sha256sums=(
    35e3cbe726e28f2f624acbe4fce8af09715e55537df7aa22ac89f00cde399515
    6a4b8aea5d687fb907d2e1bd55e41d795f43887c28fd7ab929e2d9d55e5d37d2
    b6b86d4cce7774016d03f1ded10d4b37a93e05a7ae2439f03860c5c10beed837
    4e74b7cd4ba113510ce25a249b9143761679b51823002a9d937918245cbbf289
)

package() {
    install -D -m0755 "$srcdir/server.sh" "$pkgdir/usr/bin/virt-domain-by-addr"

    install -D -m0644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -D -m0644 "$srcdir/virt-domain-by-addr-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/virt-domain-by-addr.conf"
    install -D -m0644 "$srcdir/virt-domain-by-addr.service" "$pkgdir/usr/lib/systemd/system/virt-domain-by-addr.service"

}
