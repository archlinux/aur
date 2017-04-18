# Maintainer: Nathan Lowe <techwiz96@gmail.com>
pkgname=msbuild-15-bin
_pkgver=15.1+xamarinxplat.2017.02.14.47.38-0xamarin1
pkgver=${_pkgver//[+-]/_}
pkgrel=1
pkgdesc="Xamarin implementation of the Microsoft build system"
arch=('x86_64')
depends=('mono>=4.0.0')
url="https://github.com/mono/msbuild"
license=('MIT')
source=("msbuild-amd64-v${_pkgver}.deb::http://download.mono-project.com/repo/ubuntu/pool/main/m/msbuild/msbuild_${_pkgver}_all.deb")
sha256sums=('11056f9a789bd3421553c3bedbad17c14b4ac2c1b7a211b5cf6f2c0d60c70add')

package() {
    cd "${srcdir}"

    bsdtar xf data.tar.xz
    chmod -R g-w usr
    mv usr "${pkgdir}"
}
