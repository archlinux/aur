# Maintainer: Julian Reyes <julian.reyes.escrigas@gmail.com>

pkgname=dotnet-runtime-1.1-compat
pkgver=1.1.5
pkgrel=2
pkgdesc='Provides the .NET core shared framework 1.1'
arch=(x86_64)
url=https://www.microsoft.com/net/download/linux
license=('MIT')
depends=('lldb' 'libunwind' 'icu' 'lttng-ust' 'libcurl-openssl-1.0')
provides=('dotnet=1.1.5')
source=(
  'https://download.microsoft.com/download/6/A/2/6A21C555-B042-46EA-BBB4-368AACCB3E25/dotnet-ubuntu.16.04-x64.1.1.5.tar.gz'
)

sha256sums=(
'd455a2bc61faba8faa706b176286a9946e9b15f1c7cd562c3cd3ae68da9a3905')

package() {
  mkdir -p $pkgdir/opt/dotnet
  cp --preserve=mode -r $srcdir/{host,shared} $pkgdir/opt/dotnet/
  install -Dm755 $srcdir/dotnet $pkgdir/usr/bin/dotnet-1.1
  install -Dm644 $srcdir/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
  install -Dm644 $srcdir/ThirdPartyNotices.txt $pkgdir/usr/share/licenses/$pkgname/ThirdPartyNotices.txt
}
