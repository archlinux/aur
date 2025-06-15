# maintainer : Alice , alice at espcaa dot eu
# slack tui client, built from the latest git commit

pkgname=slacktui-git
pkgver=0.1.1
pkgrel=1
pkgdesc="A terminal UI for Slack"
arch=('x86_64' 'aarch64' 'arm64')
url="https://github.com/evmar/slacktui"
license=('MIT')
depends=('go')
makedepends=('go')
source=("$pkgname::git+https://github.com/espcaa/slack-tui.git")
sha256sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	go build
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 slacktui "$pkgdir/usr/bin/slacktui"
}
