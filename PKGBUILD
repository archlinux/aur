# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Contributor: Nathan Lowe <techwiz96@gmail.com>
pkgname=msbuild-16-bin
_pkgver=16.4+xamarinxplat.2019.09.09.15.03-0xamarin5+ubuntu1804b1
pkgver=${_pkgver//[+-]/_}
pkgrel=1
pkgdesc="Xamarin implementation of the Microsoft build system"
arch=('x86_64')
depends=('mono>=5.0.0')
provides=('msbuild')
conflicts=('msbuild')
url="https://github.com/mono/msbuild"
license=('MIT')
source=("msbuild-amd64-v${_pkgver}.deb::http://download.mono-project.com/repo/ubuntu/pool/main/m/msbuild/msbuild_${_pkgver}_all.deb")
sha256sums=('47804a0ff3b7531d3c5e1d7b733189354761e08593e6d927b868b3c3f219aef3')

package() {
    cd "${srcdir}"

    bsdtar xf data.tar.xz
    chmod -R g-w usr
    mv usr "${pkgdir}"
}
