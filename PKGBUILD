# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Contributor: Nathan Lowe <techwiz96@gmail.com>
pkgname=msbuild-16-bin
_pkgver=16.3+xamarinxplat.2019.08.08.00.55-0xamarin2+ubuntu1804b1
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
sha256sums=('964f17280478373027f9f597e311aeb1a7080a94a22d4ba9fea88be0a94bfdb1')

package() {
    cd "${srcdir}"

    bsdtar xf data.tar.xz
    chmod -R g-w usr
    mv usr "${pkgdir}"
}
