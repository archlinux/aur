# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="teams-for-linux-bin"
pkgver=2.7.13
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
b2sums_x86_64=('be1ff77bb858397b6be5e16b847c6e77d697b30538675fd0b339a1ce1a957122d665da75f60b20e4adc30824fbd824cefc6c9929344567f4e7cba42fa12c5d8e')
b2sums_aarch64=('531a71069c4c39aa3c043eefce8453136a3f3e060c035ab0532e02099475dc6ebd5324481a5f9808e6a07643c88b3f0641eef89391c17009ad5e2e6021040a1c')
b2sums_armv7h=('c406f5f689915abecc84c10d71b0972ca9645fa9c5ec0500ae44c9528e37d140009937feb281f9fe5ab40c2f4c38412b4d5796c938674dc9494ef9e5ecf1c5f8')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
