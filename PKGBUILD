# Maintainer: Owen Trigueros <owentrigueros@gmail.com>

pkgname=technitium-dns-server-bin
_pkgname=technitium-dns-server
pkgver=11.0.3
pkgrel=1
pkgdesc="Open source authoritative and recursive DNS server focused on privacy and security"
arch=('any')
url="https://technitium.com/dns/"
license=('GPL3')
depends=('aspnet-runtime')
conflicts=('technitium-dns-server')
provides=('technitium-dns-server')
source=("$_pkgname-$pkgver.tar.gz::https://download.technitium.com/dns/archive/$pkgver/DnsServerPortable.tar.gz"
        "$_pkgname.service"
        "$_pkgname.sysuser")
md5sums=("30d83b51f47d5fa4cae9996e2ead44df"
        "d3efcfd93a76ead9d48b8b721d37275d"
        "94d2dc7076d37fec30115f407cb2948f")

package() {
    cd "$srcdir"

    install -Dm644 "$_pkgname.sysuser" "$pkgdir"/usr/lib/sysusers.d/$_pkgname.conf

    install -Dm 0644 DnsServerApp.deps.json "$pkgdir/opt/$_pkgname/DnsServerApp.deps.json"
    install -Dm 0644 DnsServerApp.dll "$pkgdir/opt/$_pkgname/DnsServerApp.dll"
    install -Dm 0644 DnsServerApp.exe "$pkgdir/opt/$_pkgname/DnsServerApp.exe"
    install -Dm 0644 DnsServerApp.pdb "$pkgdir/opt/$_pkgname/DnsServerApp.pdb"
    install -Dm 0644 DnsServerApp.runtimeconfig.json "$pkgdir/opt/$_pkgname/DnsServerApp.runtimeconfig.json"
    install -Dm 0644 DnsServerCore.ApplicationCommon.dll "$pkgdir/opt/$_pkgname/DnsServerCore.ApplicationCommon.dll"
    install -Dm 0644 DnsServerCore.ApplicationCommon.pdb "$pkgdir/opt/$_pkgname/DnsServerCore.ApplicationCommon.pdb"
    install -Dm 0644 DnsServerCore.dll "$pkgdir/opt/$_pkgname/DnsServerCore.dll"
    install -Dm 0644 DnsServerCore.pdb "$pkgdir/opt/$_pkgname/DnsServerCore.pdb"
    install -Dm 0644 named.root "$pkgdir/opt/$_pkgname/named.root"
    install -Dm 0644 root-anchors.xml "$pkgdir/opt/$_pkgname/root-anchors.xml"
    install -Dm 0644 TechnitiumLibrary.ByteTree.dll "$pkgdir/opt/$_pkgname/TechnitiumLibrary.ByteTree.dll"
    install -Dm 0644 TechnitiumLibrary.ByteTree.pdb "$pkgdir/opt/$_pkgname/TechnitiumLibrary.ByteTree.pdb"
    install -Dm 0644 TechnitiumLibrary.dll "$pkgdir/opt/$_pkgname/TechnitiumLibrary.dll"
    install -Dm 0644 TechnitiumLibrary.IO.dll "$pkgdir/opt/$_pkgname/TechnitiumLibrary.IO.dll"
    install -Dm 0644 TechnitiumLibrary.IO.pdb "$pkgdir/opt/$_pkgname/TechnitiumLibrary.IO.pdb"
    install -Dm 0644 TechnitiumLibrary.Net.dll "$pkgdir/opt/$_pkgname/TechnitiumLibrary.Net.dll"
    install -Dm 0644 TechnitiumLibrary.Net.pdb "$pkgdir/opt/$_pkgname/TechnitiumLibrary.Net.pdb"
    install -Dm 0644 TechnitiumLibrary.pdb "$pkgdir/opt/$_pkgname/TechnitiumLibrary.pdb"

    cp -r www "$pkgdir/opt/$_pkgname/www"

    install -dm755 "$pkgdir/opt/$_pkgname/config"

    install -Dm 0644 "$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
}
