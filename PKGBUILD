# Author: mosra <mosra@centrum.cz>
pkgname=tnb
pkgver=2019_11_25
pkgrel=1
pkgdesc="CLI-based Telegram Notification Bot"
arch=('x86_64')
url="https://github.com/Wint3rmute/tnb.git"
license=('custom:WTFPL')
makedepends=('git' 'rust')

source=("git+git://github.com/Wint3rmute/tnb.git")
sha1sums=('SKIP')

# pkgver() {
#     #cd "$srcdir/${pkgname%-git}"
#     #git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
# }

build() {
    cd "$srcdir/${pkgname%-git}"
    # ls
    cargo build --release --locked
}

package() {
    cd "$srcdir/${pkgname%-git}"
    
    install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
