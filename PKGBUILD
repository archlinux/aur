# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="teams-for-linux-bin"
pkgver=2.11.1
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
b2sums_x86_64=('ea34e62a7052803c3211239ba051a68e050a6ef9222fbd4c81026ed742dac8627a4be4f52ec445294abae4298d6694578d87ae7e32f751675134460e445178b6')
b2sums_aarch64=('eeff42d705dd4b533d80f0df902df19614b83f1a6f0862d1018ab16ce7eaa9e5f7da6de82a7f22f55bce143ba33f44941bf0a7aa5344818210caa78ee699749a')
b2sums_armv7h=('3412367eff8a32cc4395f4fcbe334bf0bf0490a3baf563b22e29165f1b669e5dc3f87b4eb40fa603a5e5f8b435e19d84bc41eae6678d4cf42b33fdf5087b9d71')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
