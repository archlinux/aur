# Maintainer: Matthias Mailänder <matthias@mailaender.name>
# Contributor: Jakob Senkl <js@jakobsenkl.pw>

pkgname=fsharp-mono-bin
pkgver=5.0.0.0
pkgrel=1
pkgdesc="The legacy Mono F# Compiler, Core Library & Tools (Xamarin binary build). Newer versions are included in dotnet-core."
arch=('any')
url="http://fsharp.org/"
license=('MIT')
depends=('mono')
replaces=('fsharp-bin')
conflicts=('fsharp')
provides=("fsharp=${pkgver}")

_pkgver=5.0

source=("https://download.mono-project.com/repo/ubuntu/pool/main/f/fsharp/fsharp_$pkgver-0xamarin15+ubuntu2004b1_all.deb"
        "https://download.mono-project.com/repo/ubuntu/pool/main/f/fsharp/libfsharp-core$_pkgver-cil_$pkgver-0xamarin15+ubuntu2004b1_all.deb")
        
noextract=("fsharp_$_pkgver-0xamarin15+ubuntu2004b1_all.deb"
           "libfsharp-core$_pkgver-cil_$_pkgver-0xamarin15+ubuntu2004b1_all.deb")

sha256sums=('cc5fb438e5e05f569c7960fc840f75b5520db0430cb603693c4b5845a52201f9'
            '8e29923ae7f8643c3f0f74727743ab9f369e31864c2505fa734ba16108b533a6')

package() {
    cd "${pkgdir}"
    ar x "${srcdir}/libfsharp-core$_pkgver-cil_${pkgver}-0xamarin15+ubuntu2004b1_all.deb"
    tar xf "data.tar.xz"
    ar x "${srcdir}/fsharp_${pkgver}-0xamarin15+ubuntu2004b1_all.deb"
    tar xf "data.tar.xz"
    
    rm *.tar.xz debian-binary
}

