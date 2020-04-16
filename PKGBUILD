# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-core-2.2
pkgname=('dotnet-runtime-2.2' 'dotnet-sdk-2.2')
pkgver=2.2.8.sdk207
_runtimever=2.2.8
_sdkver=2.2.207
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/fca1c415-b70c-4134-8844-ea947f410aad/901a86c12be90a67ec37cd0cc59d5070/dotnet-sdk-2.2.207-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/18738093-b024-4353-96c2-4e1d2285a5e4/5e86ebbca79e71486aa2b18af0214ae9/dotnet-sdk-2.2.207-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/022d9abf-35f0-4fd5-8d1c-86056df76e89/477f1ebb70f314054129a9f51e9ec8ec/dotnet-sdk-2.2.207-linux-x64.tar.gz')
sha512sums_armv7h=('a922b87fc1e433d489d6863fa3faca5a5eeb33f68104c5c4733ca8fbd187230715f6ce384ddbdaca501b1f42c87f590a9299b525be405214803bb1da3c4bbd1c')
sha512sums_aarch64=('565fe5cbc2c388e54b3ee548d5b98e1fd85d920ceeeb5475a2bf2daa7f090fc925d8afef19b2b76973af439fbb749c6996711790287eafd588e4d916a016e84c')
sha512sums_x86_64=('9d70b4a8a63b66da90544087199a0f681d135bf90d43ca53b12ea97cc600a768b0a3d2f824cfe27bd3228e058b060c63319cd86033be8b8d27925283f99de958')

# Versioning details for dependencies
# https://docs.microsoft.com/en-us/dotnet/core/versions/#versioning-details

package_dotnet-runtime-2.2() {
  pkgdesc='The .NET Core runtime binary version 2.2 - latest (End of Life)'
  depends=('dotnet-host' 'icu' 'krb5' 'libunwind' 'openssl' 'zlib'
           'libcurl.so')
  optdepends=('lttng-ust: CoreCLR tracing')
  provides=("dotnet-runtime-2.2" "dotnet-runtime=${pkgver}")
  conflicts=("dotnet-runtime-2.2")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-2.2 "${pkgdir}"/usr/share/licenses/dotnet-runtime-2.2
}

package_dotnet-sdk-2.2() {
  pkgdesc='The .NET Core SDK binary version 2.2 - latest (End of Life)'
  depends=('dotnet-runtime-2.2')
  provides=("dotnet-sdk-2.2" "dotnet-sdk=${pkgver}")
  conflicts=("dotnet-sdk-2.2")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  cp -dr --no-preserve='ownership' sdk "${pkgdir}"/usr/share/dotnet/
  ln -s dotnet-host-2.2 "${pkgdir}"/usr/share/licenses/dotnet-sdk-2.2
}
