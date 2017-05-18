# Maintainer: Nathan Lowe <techwiz96@gmail.com>
pkgname=msbuild-15-bin
_pkgver=15.2+xamarinxplat.2017.05.04.00.44-0xamarin3+ubuntu1404b1
pkgver=${_pkgver//[+-]/_}
pkgrel=2
pkgdesc="Xamarin implementation of the Microsoft build system"
arch=('x86_64')
depends=('mono>=5.0.0')
provides=('msbuild')
conflicts=('msbuild')
url="https://github.com/mono/msbuild"
license=('MIT')
source=("msbuild-amd64-v${_pkgver}.deb::http://download.mono-project.com/repo/ubuntu/pool/main/m/msbuild/msbuild_${_pkgver}_all.deb")
sha256sums=('35dd663e764abd335f8bc95b31dbae74dd1f25a1953582769a122e97978ed915')

package() {
    cd "${srcdir}"

    bsdtar xf data.tar.xz
    chmod -R g-w usr
    mv usr "${pkgdir}"
}
