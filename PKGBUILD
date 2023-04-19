# Maintainer: Mikescher <aur@mikescher.com>
# Repo:       https://github.com/Mikescher/firefox-sync-client

pkgname=ffsclient-git
pkgver=1.5.0
pkgrel=1

pkgdesc="A cli to access firefox-sync data"

url="https://github.com/Mikescher/firefox-sync-client"
license=('Apache')

makedepends=('go' 'git')

arch=('any')

source=("$pkgname::git+https://github.com/Mikescher/firefox-sync-client")

sha256sums=('SKIP')

build() {
  cd "$pkgname"
  go build -o ffsclient  cmd/ffsclient/main.go
}

package()
{
  install -D -m755 "$pkgname/ffsclient" "${pkgdir}/usr/bin/ffsclient"
}

