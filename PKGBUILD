# Maintainer: jtmb <packaging at technologicalwizardry dot com>
pkgname=msbuild-stable
_pkgver=15.4+xamarinxplat.2017.11.27.11.23-0xamarin1+ubuntu1404b1
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
sha256sums=('599439826207b39c0ab6f3ea7b4889febef1394bf1193345712d4b470e655f65')

package() {
    cd "${srcdir}"

    bsdtar xf data.tar.xz
    chmod -R g-w usr
    mv usr "${pkgdir}"
}
