# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="teams-for-linux-bin"
pkgver=2.6.13
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
b2sums_x86_64=('2c4172122892971e9b986248a32a20c257d4f853f7d8650224d2848f9fc73119c4194e95d600f7bcc01d60c6fd30d7c5378e45d0b4204254f3a7f0806b2bfeeb')
b2sums_aarch64=('7e37e873dc9b08100b98a8670ff0f0bdcc29ece249ba180cddbc3746733323bbf0b0752c7243de3f9926f72adbca2b2e738bf6c3ee7e076952ad2c0a22e3be2a')
b2sums_armv7h=('daa2fdffb3b0742c7c78679dabf835c135a2c11d92e3ef556521b5f67b68ab8d67072941489c93885e8645c994f4f76842e0bed740522779e7cf571cb7e6269f')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
