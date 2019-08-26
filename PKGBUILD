# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=monodevelop-bin
_pkgver=7.8.4.1-0xamarin6+ubuntu1804b1
pkgver=${_pkgver//[+-]/_}
pkgrel=1
pkgdesc="MonoDevelop is a GNOME IDE primarily designed for C# and other CLI (.NET) languages"
arch=('x86_64')
optdepends=('fsharp: for building fsharp programs')
provides=('monodevelop')
conflicts=('monodevelop')
url="https://github.com/mono/monodevelop"
license=('MIT')
source=("monodevelop-amd64-v${_pkgver}.deb::http://download.mono-project.com/repo/ubuntu/pool/main/m/monodevelop/monodevelop_7.8.4.1-0xamarin6+ubuntu1804b1_arm64.deb")
sha256sums=('1ac6d08253ea0f3e2e9e12937302f6872aa825ce9bf974935e7e5db968c978bd')

package() {
    cd "${srcdir}"

    bsdtar xf data.tar.xz
    chmod -R g-w usr
    mv usr "${pkgdir}"
}
