# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=dotnet-runtime-bin
pkgver=2.2.6
pkgrel=3
pkgdesc="The .NET Core runtime (binary version)"
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/dotnet/core"
license=('MIT')
provides=('dotnet-runtime')
conflicts=('dotnet-runtime')
source=("dotnet.sh")
sha512sums=('181ccf9499e1b38576b7f87eb04c1fad7aede4b7e56d246e00ca7956ec15996221862db00a2a5014bdb482eb5a363ca49fc6b661909d2d9e22a374318c5c0066')
source_armv7h=("https://download.visualstudio.microsoft.com/download/pr/428aaa32-f66c-4847-b845-aa21f90504e4/1cf033db866414997140c2672bd75069/dotnet-runtime-2.2.6-linux-arm.tar.gz")
source_x86_64=("https://download.visualstudio.microsoft.com/download/pr/9f21e352-9d2c-4e3b-af45-915da89158db/0e8a7ea83cc08d4bcf417a927a36ed6f/dotnet-runtime-2.2.6-linux-x64.tar.gz")
source_aarch64=("https://download.visualstudio.microsoft.com/download/pr/f5e04830-50fc-435c-8bb5-fcd4629da944/8aa7cce5c3fcb6a7db180b923d3574ef/dotnet-runtime-2.2.6-linux-arm64.tar.gz")
sha512sums_x86_64=('8af7a39407b4a3503a7c6d83106336140eeef2bc24decf1b817c7d5a3e5596c8cefed8f211019148cd89a31759d851836dd6147e544b8c1d183dcfbd5a8d4636')
sha512sums_armv7h=('d61b66a6663676f04fb1ae19129d793109db7bb1bf88dc9fba32257b214b852b3579da2114e41a7103392871ce62e1b93e9ca99f57b79804c72de06d52168acb')
sha512sums_aarch64=('55a14b94ae5b981d8ac6218edd2d8119776e778f094071fcf0f9e42affeb3992552d31840a7368fd9c01e8b23566651d02ba88cdc9e38b46b91acc4e485d6663')
options=('!strip')

package() {
	install -D "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	mkdir -p "${pkgdir}/usr/share/dotnet-runtime"
	install -dm 755 "${pkgdir}/usr/share/dotnet-runtime"
	install -D "${srcdir}/dotnet" "${pkgdir}/usr/share/dotnet-runtime/dotnet"
	cp -r "${srcdir}/host" "${pkgdir}/usr/share/dotnet-runtime/"
	cp -r "${srcdir}/shared" "${pkgdir}/usr/share/dotnet-runtime/"
	install -Dm 755 "${srcdir}"/dotnet.sh "${pkgdir}"/usr/bin/dotnet
}
