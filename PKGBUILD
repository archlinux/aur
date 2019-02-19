# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=dotnet-runtime-bin
pkgver=2.2.2
pkgrel=1
pkgdesc="The .NET Core runtime (binary version)"
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/dotnet/core"
license=('MIT')
provides=('dotnet-runtime')
conflicts=('dotnet-runtime')
source_armv7h=("https://download.visualstudio.microsoft.com/download/pr/a24ca9ae-7966-4a9e-9838-cc57d6639248/099c000dc8ee58702846702e9b010ad1/dotnet-runtime-${pkgver}-linux-arm.tar.gz")
source_x86_64=("https://download.visualstudio.microsoft.com/download/pr/97b97652-4f74-4866-b708-2e9b41064459/7c722daf1a80a89aa8c3dec9103c24fc/dotnet-runtime-${pkgver}-linux-x64.tar.gz")
source_aarch64=("https://download.visualstudio.microsoft.com/download/pr/4f960c44-ae38-4510-95e9-0b686fcae16f/be50a7c893543038522f5943d920db01/dotnet-runtime-${pkgver}-linux-arm64.tar.gz")
sha512sums_armv7h=('d3842d4f7be058d4a782bf11102970ca6718e715b533d9f36551b5ceaeea5e4bc811497acf70f6be9a72d7cc029feda5da6dfd8ec6e712a8181df60a64eb9659')
sha512sums_x86_64=('76b252c3fab234f9792b927f5af2015a635532d183fd38b982047f677870ff5ca19050726d7406e9c90cde593281a401a00dab5315e10ac5a16e9255a57fd34a')
sha512sums_aarch64=('32209c69cacfdec8467cccdb719ccb37a4bec3f88720209d752903d783df616099c49d8b58ff9635b83af589cc473bf7927b8b012a751b3a8b28b1ef60dc86c6')

package() {
	install -D "${srcdir}/dotnet" "${pkgdir}/usr/bin/dotnet"
	install -D "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	mkdir -p "${pkgdir}/usr/share/dotnet-runtime"
	cp -r "${srcdir}/host" "${srcdir}/shared" "${pkgdir}/usr/share/dotnet-runtime/"
}
