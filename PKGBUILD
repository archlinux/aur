# Maintainer: Nathan Lowe <techwiz96@gmail.com>
pkgname=msbuild-15-bin
_pkgver=15.5+xamarinxplat.2017.08.16.12.03-0xamarin3+ubuntu1404b1
pkgver=${_pkgver//[+-]/_}
pkgrel=3
pkgdesc="Xamarin implementation of the Microsoft build system"
arch=('x86_64')
depends=('mono>=5.0.0')
provides=('msbuild')
conflicts=('msbuild')
url="https://github.com/mono/msbuild"
license=('MIT')
source=("msbuild-amd64-v${_pkgver}.deb::http://download.mono-project.com/repo/ubuntu/pool/main/m/msbuild/msbuild_${_pkgver}_all.deb")
sha256sums=('ecacb078e23c717fb787346253e9362484ef5bdaf88340e27c1204156bcc2803')

package() {
    cd "${srcdir}"

    bsdtar xf data.tar.xz
    chmod -R g-w usr
    mv usr "${pkgdir}"
}
