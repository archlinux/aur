# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="teams-for-linux-bin"
pkgver=2.10.0
pkgrel=1
pkgdesc="Unofficial Microsoft Teams for Linux client (binary version)"
url="https://github.com/IsmaelMartinez/teams-for-linux"
license=("GPL3")
arch=("x86_64" "aarch64" "armv7h")
provides=("teams-for-linux")
conflicts=("teams-for-linux"
           "teams-for-linux-appimage"
           "teams-for-linux-git"
           "teams-for-linux-wbundled-electron"
          )
depends=("gtk3" "libxss" "nss")
source_x86_64=("$url/releases/download/v$pkgver/teams-for-linux_${pkgver}_amd64.deb")
source_aarch64=("$url/releases/download/v$pkgver/teams-for-linux_${pkgver}_arm64.deb")
source_armv7h=("$url/releases/download/v$pkgver/teams-for-linux_${pkgver}_armv7l.deb")
b2sums_x86_64=('1ebf3821c9a3fe74670da944939ef89729c7d8605b00ca545c138f3c20debcfad394dda94fc40a1fc33708028235e207ea2eec6d5d0450fbf1ca47cfff8410a5')
b2sums_aarch64=('d90be50b22494360dd3c7964d15441d347a153949dc6a367465cb0ae3af86bfbf0248a0f3f1a15022862d5b6204120cf98526238c83050b2c2a300d7fc51c5a7')
b2sums_armv7h=('6746b1c97d635aef838a46d4733cc2764bdb5bd7163a169114787037fc284caa3d1b9bdeeaacc6bbf30748f721445b60c70ad4e3355626c4eca74a524ffff85f')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
