# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>

pkgname=netcoredbg-bin
_name=${pkgname%-bin}
_pkgver=3.2.0-1092
pkgver="${_pkgver//-/_}"
pkgrel=1
pkgdesc='Debugger for .NET Core runtime'
url='https://github.com/Samsung/netcoredbg'
license=('MIT')
arch=('x86_64')
provides=('netcoredbg')
conflicts=('netcoredbg')
depends=('dotnet-runtime-10.0' 'glibc' 'gcc-libs')

source=("$pkgname-$_pkgver.tar.gz::https://github.com/Samsung/netcoredbg/releases/download/$_pkgver/$_name-linux-amd64.tar.gz"
        "$_name-$_pkgver-LICENSE::https://raw.githubusercontent.com/Samsung/netcoredbg/$_pkgver/LICENSE")
sha256sums=('080eb3b2d2152465f599d3b33d1ee6e747794e11cc0a3773ec689f5e5f2c5afa'
            '6cd03b0de8299b0800f22b35ae842c931ded7684a2d1ba4f1d4188bab9b09a11')

package() {
    install -d "$pkgdir/opt"
    cp -a "netcoredbg" "$pkgdir/opt"

    install -d "$pkgdir/usr/bin"
    ln -s /opt/netcoredbg/netcoredbg "$pkgdir/usr/bin"

    install -Dm644 "$_name-$_pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
