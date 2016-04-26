# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Tom Richards <tom [at] tomrichards [dot] net>

pkgname=caddy
pkgver=0.8.3
pkgrel=1
pkgdesc="A configurable, general-purpose HTTP/2 web server for any platform"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://caddyserver.com"
license=('Apache')
install='caddy.install'
conflicts=('caddy-git')

source=('caddy.service')
sha256sums=('244fa03febae623f1b10adfb6883a9573ba81747b8e535bb23101ab230ccbf95')

source_i686=("https://github.com/mholt/caddy/releases/download/v$pkgver/caddy_linux_386.tar.gz")
sha256sums_i686=('25b173dc2f47bd22c48efb6831c713f3100c9d70a04d69f81bc3dc236abc7624')

source_x86_64=("https://github.com/mholt/caddy/releases/download/v$pkgver/caddy_linux_amd64.tar.gz")
sha256sums_x86_64=('cd3539f89c9cbccf0393e850073f788b9c95975bcecf4027ea062b0b1d9f66ac')

source_armv7h=("https://github.com/mholt/caddy/releases/download/v$pkgver/caddy_linux_arm7.tar.gz")
sha256sums_armv7h=('ab67746c2ff9d7060b6be200d176ba1c212f20988fd34f0ca61a9a5215978a73')

source_aarch64=("https://github.com/mholt/caddy/releases/download/v$pkgver/caddy_linux_arm64.tar.gz")
sha256sums_aarch64=('766f2a358e9d057e9b112ea91e83467c2b339ef1cf2488c6a1e0749511c8e3d7')

package() {
  install -Dm755 "$srcdir/caddy" "$pkgdir/usr/bin/caddy"
  install -Dm644 "${srcdir}/caddy.service" "${pkgdir}/usr/lib/systemd/system/caddy.service"
}
