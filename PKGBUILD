# Maintainer: Sadra Jalili <sadra.jl79@proton.me>
pkgname=grpc-csharp-plugin-bin
pkgver=2.66.0
pkgrel=2
pkgdesc="Pre-compiled grpc_csharp_plugin binary extracted from Grpc.Tools NuGet package"
arch=('x86_64' 'i686' 'aarch64')
url="https://www.nuget.org/packages/Grpc.Tools/"
license=('Apache')
depends=()
source=("Grpc.Tools.$pkgver.nupkg::https://www.nuget.org/api/v2/package/Grpc.Tools/${pkgver}")
sha256sums=('50cdd034230a7280c18530fd393931a8e4fb10eb0056220ce721764b319cd133')

package() {
    cd "$srcdir/tools"
    case "$CARCH" in
    x86_64)
        source_architecture="x64";;
    i686)
        source_architecture="x86";;
    aarch64)
        source_architecture="arm64";;
    esac

    install -Dm755 "linux_${source_architecture}/grpc_csharp_plugin" "$pkgdir/usr/bin/grpc_csharp_plugin"
}

