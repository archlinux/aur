# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Tom Richards <tom [at] tomrichards [dot] net>

pkgname=caddy
pkgver=0.8.2
pkgrel=1
pkgdesc="A configurable, general-purpose HTTP/2 web server for any platform"
arch=('i686' 'x86_64' 'armv6h')
url="https://caddyserver.com"
license=('Apache')
install='caddy.install'
conflicts=('caddy-git')

source=('caddy.service')
sha256sums=('244fa03febae623f1b10adfb6883a9573ba81747b8e535bb23101ab230ccbf95')

source_i686=("https://github.com/mholt/caddy/releases/download/v$pkgver/caddy_linux_386.tar.gz")
sha256sums_i686=('0012f54d09ae6bad96f86554aad6eb2d7c1f08bb7d9a72fdf640a53b0542352a')

source_x86_64=("https://github.com/mholt/caddy/releases/download/v$pkgver/caddy_linux_amd64.tar.gz")
sha256sums_x86_64=('497ddf916b1d38e5435c4bd996b89c208ecb6dc05cf447381e549d39a616db4b')

source_armv6h=("https://github.com/mholt/caddy/releases/download/v$pkgver/caddy_linux_arm.tar.gz")
sha256sums_armv6h=('7e9ad0171f9cdd78a95b35e19cc973b9a8108f391a3fafa4c05d4201248e4627')

package() {
  install -Dm755 "$srcdir/caddy" "$pkgdir/usr/bin/caddy"
  install -Dm644 "${srcdir}/caddy.service" "${pkgdir}/usr/lib/systemd/system/caddy.service"
}
