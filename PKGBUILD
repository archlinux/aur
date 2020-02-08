# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Contributor: Nathan Lowe <techwiz96@gmail.com>
pkgname=msbuild-16-bin
_pkgver=16.5+xamarinxplat.2020.01.10.05.36-0xamarin1+ubuntu1804b1
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
sha256sums=('62744cee275e7c8ffb264a1588940228d39be7b30e8be98d91140a5efe199ec2')

package() {
    cd "${srcdir}"

    bsdtar xf data.tar.xz
    chmod -R g-w usr
    mv usr "${pkgdir}"
}
