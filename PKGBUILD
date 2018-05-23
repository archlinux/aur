# Maintainer: jtmb <packaging at technologicalwizardry dot com>
pkgname=msbuild-stable
_pkgver=15.6+xamarinxplat.2018.01.17.14.14-0xamarin1+ubuntu1404b1
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
sha256sums=('262519a70e62b62861339ceddb5654cce24652a1919cbcd25094bbaac41a7c72')

package() {
    cd "${srcdir}"

    bsdtar xf data.tar.xz
    chmod -R g-w usr
    mv usr "${pkgdir}"
}
