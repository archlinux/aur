# Maintainer: Owen Trigueros <owentrigueros@gmail.com>

pkgname=technitium-dns-server-bin
_pkgname=technitium-dns-server
pkgver=14.2.0
pkgrel=1
pkgdesc="Open source authoritative and recursive DNS server focused on privacy and security"
arch=('any')
url="https://technitium.com/dns/"
license=('GPL3')
depends=('aspnet-runtime-9.0')
conflicts=('technitium-dns-server')
provides=('technitium-dns-server')
source=("$_pkgname-$pkgver.tar.gz::https://download.technitium.com/dns/archive/$pkgver/DnsServerPortable.tar.gz"
        "$_pkgname.service"
        "$_pkgname.sysuser")
sha256sums=("bdeab565b4dbc79be47ed604cfc8f33730c38ae83e6c5ee5b57a036779b8f2d3"
            "464dbfe1038e4737ca83c60617a5a4e334cdd948fe41315a3a36913011680952"
            "d349d144faf8932c56a054b22721420f1eb68adf7bc226f174654b33510f75e4")

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
    install -Dm 0644 DnsServerCore.HttpApi.dll "$pkgdir/opt/$_pkgname/DnsServerCore.HttpApi.dll"
    install -Dm 0644 DnsServerCore.HttpApi.pdb "$pkgdir/opt/$_pkgname/DnsServerCore.HttpApi.pdb"
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
    install -Dm 0644 TechnitiumLibrary.Security.OTP.dll "$pkgdir/opt/$_pkgname/TechnitiumLibrary.Security.OTP.dll"
    install -Dm 0644 TechnitiumLibrary.Security.OTP.pdb "$pkgdir/opt/$_pkgname/TechnitiumLibrary.Security.OTP.pdb"
    install -Dm 0644 BouncyCastle.Cryptography.dll "$pkgdir/opt/$_pkgname/BouncyCastle.Cryptography.dll"
    install -Dm 0644 QRCoder.dll "$pkgdir/opt/$_pkgname/QRCoder.dll"
    install -Dm 0644 System.Drawing.Common.dll "$pkgdir/opt/$_pkgname/System.Drawing.Common.dll"

    cp -r www "$pkgdir/opt/$_pkgname/www"
    cp -r dohwww "$pkgdir/opt/$_pkgname/dohwww"

    install -dm755 "$pkgdir/opt/$_pkgname/config"

    install -Dm 0644 "$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
}
