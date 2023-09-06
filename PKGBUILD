# Maintainer: Alexander Egorov <egoroff[at]gmail[dot]com>

pkgbase=dotnet-core-6.0.110-bin
pkgname=(
  'dotnet-sdk-6.0.110-bin'
 )
pkgver=6.0.10.sdk110
_sdkver=6.0.110
pkgrel=3
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/ec48c241-aa98-44fb-8e9e-f8ec91f048ec/8c9b79c23058a1c0ad7b3e0fdc340d41/dotnet-sdk-6.0.110-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/1a0faccb-a85e-43b7-b2a6-78ee8b975855/572b91765e7db29d33887cf4b87bc86c/dotnet-sdk-6.0.110-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/3e527e7b-3a94-48a7-a392-2e75f20a6d15/1d253d740e987ac9c79f33967f18066d/dotnet-sdk-6.0.110-linux-x64.tar.gz')
sha512sums_armv7h=('ed8a0a3c5edc42b6e82dc925c35ebd3ba0ddf94b98c97febb0f4ffa758b369b2c063935fa62cc5e18c1f26e64e0618daf2600d8a9946a0d44f6103d725d99091')
sha512sums_aarch64=('da312773a6def29612ea6898c489b86b2546e5e52c7c890134712c64fb3c0e52dfab88d8589858f9a9b39c3d2c9fc39406d6da251e3cfca399eb93df0c9ad5c6')
sha512sums_x86_64=('104da00b7bfe1f564723e2314d432ad9044cbfa9ad851bc99e06e730a032c6178e487a8bee3f28f8309a32652df0143301be0b827a0c7ad00614a1ce850495e8')

package_dotnet-sdk-6.0.110-bin() {
  pkgdesc='The .NET Core SDK (binary)'
  depends=(
    'glibc'
    'gcc-libs'
    'netstandard-targeting-pack')
  provides=("dotnet-sdk=${pkgver}" "dotnet-sdk-6.0.110")
  conflicts=("dotnet-sdk=${pkgver}" "dotnet-sdk-6.0.110")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  cp -dr --no-preserve='ownership' sdk sdk-manifests "${pkgdir}"/usr/share/dotnet/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-sdk-6.0.110-bin
}

