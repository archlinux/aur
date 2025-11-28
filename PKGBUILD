# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="teams-for-linux-bin"
pkgver=2.6.17
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
b2sums_x86_64=('da72c3f7b95650b47874d97bb1acfc5ac3a3e4dabd4094c592657bc7011ee985a1d0fec381810fe018f52cb8c30e568edc6ac5e49486675e62b88b54df8406e8')
b2sums_aarch64=('e080a7b7f3162e43d2dd48a1333b8f3d8834e9c1c8aeddcc3a93557884fdf55068f50d97f06bdabe6428de6c2f5c78c43dbb6ebffe03832cbfffe5e644b6841e')
b2sums_armv7h=('05fb979c910087e40ae1aeb7ee147070eef439fa7567e1ede32c420b3fae5df5a09589d90cc151193c38a0c09216f79ce695d5cb69af6fe1cfb84048e9e2d890')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
