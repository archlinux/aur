# Maintainer: tr0llslay3r <https://github.com/tr0llslay3r>
pkgname=snazzgit-bin
pkgver=0.2.8
pkgrel=1
pkgdesc="A snazzy cross-platform Git GUI client"
arch=('x86_64')
url="https://github.com/tr0llslay3r/SnazzGit"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'glib2' 'openssl')
provides=('snazzgit')
conflicts=('snazzgit' 'snazzgit-git')
source=("${url}/releases/download/v${pkgver}/snazzgit_${pkgver}_amd64.deb")
sha256sums=('SKIP')

package() {
  bsdtar -xf data.tar.* -C "$pkgdir/"

  # Install license
  install -Dm644 "$pkgdir/usr/share/doc/snazzgit/copyright" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}
