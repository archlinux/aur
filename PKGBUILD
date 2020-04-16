# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgname=('dotnet-sdk-2.2-vs2017')
pkgver=2.2.8.sdk110
_runtimever=2.2.8
_sdkver=2.2.110
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
pkgdesc='The .NET Core SDK binary version 2.2 - latest (End of Life) Visual Studio 2017 compatible'
depends=('dotnet-runtime-2.2')
provides=("dotnet-sdk-2.2-vs2017" "dotnet-sdk=${pkgver}")
conflicts=("dotnet-sdk-2.2-vs2017" "dotnet-sdk=${pkgver}")
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/8cbe9c20-2e88-43dc-8d9a-27da95e5a1e7/d580d095fc8d236d7db15336668d9173/dotnet-sdk-2.2.110-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/06413d6a-e12b-41fc-91cf-d88a6f97a5c1/5a32f67fe5ad0457309cf8e0fa52f2b8/dotnet-sdk-2.2.110-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/42f39f2f-3f24-4340-8c57-0a3133620c21/0a353696275b00cbddc9f60069867cfc/dotnet-sdk-2.2.110-linux-x64.tar.gz')
sha512sums_armv7h=('7a4c26448216d8e4e1433c4070972f5314fe69c8f7b8f66993b0a60465282fbd6b6a9cd8de9da251982f55f24a5853bd400c6cbf5e4ed40213b80b62e541d8c5')
sha512sums_aarch64=('921ee8b9409a36ccc0d49fa90af68aa387bb0a7fbe7eea06c10b76cb2c53b81e08ce7767f4b18afdd4ce46194ca5e0de787b105a906f4da6c03dd5b284518063')
sha512sums_x86_64=('cd3bc601ccc45edf38cdcc254831b88539dd51f26bdafa2d74eebb09d20d19d745fe319a93c4290e3b74a7a5d8fe851773a748ef0f23f7997c76b26e74d0d94f')

package() {
  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  cp -dr --no-preserve='ownership' sdk "${pkgdir}"/usr/share/dotnet/
  ln -s dotnet-host-2.2 "${pkgdir}"/usr/share/licenses/dotnet-sdk-2.2-vs2017
}