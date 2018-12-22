
pkgname=xamarin-android
_pkgver=9.1.199.38
pkgver=${_pkgver//[+-]/_}
pkgrel=3
pkgdesc="Xamarin android build from jenkins.mono-project"
arch=('x86_64')
depends=('mono>=5.0.0' 'libzip')
options=(!strip)
provides=('xamarin-android')
conflicts=('xamarin-android')
url="https://github.com/xamarin/xamarin-android"
license=('MIT')
source=("xamarin.android-oss_${_pkgver}.deb::https://jenkins.mono-project.com/view/Xamarin.Android/job/xamarin-android-linux/lastSuccessfulBuild/Azure/processDownloadRequest/xamarin-android/xamarin.android-oss_${_pkgver}_amd64.deb")
sha256sums=('SKIP')

package() {
    cd "${srcdir}"
    bsdtar xf data.tar.xz
    chmod -R g-w usr
    mv usr "${pkgdir}"
}
