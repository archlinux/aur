# Maintainer: Jakob Senkl <js@jakobsenkl.pw>

pkgname=fsharp-mono-bin
pkgver=4.5.0
pkgrel=1
pkgdesc="The legacy Mono F# Compiler, Core Library & Tools (Xamarin binary build). Newer versions are included in dotnet-core."
arch=('any')
url="http://fsharp.org/"
license=('MIT')
depends=('mono' 'msbuild-stable')
replaces=('fsharp-bin')
conflicts=('fsharp')
provides=("fsharp=${pkgver}")

_pkgver=4.5

source=("https://download.mono-project.com/repo/ubuntu/pool/main/f/fsharp/fsharp_$_pkgver-0xamarin9+ubuntu1804b1_all.deb"
        "https://download.mono-project.com/repo/ubuntu/pool/main/f/fsharp/libfsharp-core$_pkgver-cil_$_pkgver-0xamarin9+ubuntu1804b1_all.deb")
        
noextract=("fsharp_$_pkgver-0xamarin9+ubuntu1804b1_all.deb"
           "libfsharp-core$_pkgver-cil_$_pkgver-0xamarin9+ubuntu1804b1_all.deb")

sha256sums=('a475d3053c9747a0d85b15722d3bd77ab9a3efe15a4cf3df7f1817a53313d1db'
            '3e4c87ad762121460215a853e9cba6933e679b03ab4459a1d4236399ec2afb56')

package() {
    cd "${pkgdir}"
    ar x "${srcdir}/libfsharp-core$_pkgver-cil_${_pkgver}-0xamarin9+ubuntu1804b1_all.deb"
    tar xf "data.tar.xz"
    ar x "${srcdir}/fsharp_${_pkgver}-0xamarin9+ubuntu1804b1_all.deb"
    tar xf "data.tar.xz"
    
    rm *.tar.xz debian-binary
}

