# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Tom Richards <tom [at] tomrichards [dot] net>

pkgname=caddy-all-features
pkgver=0.8.2
pkgrel=1
pkgdesc="A configurable, general-purpose HTTP/2 web server for any platform (All features enabled)"
arch=('i686' 'x86_64' 'armv6h')
url="https://caddyserver.com"
license=('Apache')
install='caddy.install'
provides=('caddy')
conflicts=('caddy')
conflicts=('caddy-git')

source=('caddy.service')
sha256sums=('244fa03febae623f1b10adfb6883a9573ba81747b8e535bb23101ab230ccbf95')

source_i686=('caddy.tar.gz::https://caddyserver.com/download/build?os=linux&arch=386&features=cors%2Cgit%2Chugo%2Cipfilter%2Cjsonp%2Csearch')
sha256sums_i686=('695ed2224063dffcfa0973cf57575861dc0fa9156bf762dcb9b212f75dd6d728')

source_x86_64=('caddy.tar.gz::https://caddyserver.com/download/build?os=linux&arch=amd64&features=cors%2Cgit%2Chugo%2Cipfilter%2Cjsonp%2Csearch')
sha256sums_x86_64=('6d603b2593b7e5e3f110aaf5d80635ac041073f08d817b4e575632b57ac7075a')

source_armv6h=('caddy.tar.gz::https://caddyserver.com/download/build?os=linux&arch=arm&features=cors%2Cgit%2Chugo%2Cipfilter%2Cjsonp%2Csearch')
sha256sums_armv6h=('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')

package() {
  install -Dm755 "$srcdir/caddy" "$pkgdir/usr/bin/caddy"
  install -Dm644 "${srcdir}/caddy.service" "${pkgdir}/usr/lib/systemd/system/caddy.service"
}
