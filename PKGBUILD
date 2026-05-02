# makepkg --printsrcinfo > .SRCINFO
pkgname=worklog-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Local-first desktop project manager for small dev teams"
arch=('x86_64')
url="https://github.com/regisx001/worklog"
license=('MIT')
depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'libsoup3'
  'glib2'
  'gcc-libs'
)
source=("https://github.com/regisx001/worklog/releases/download/app-v${pkgver}/worklog_${pkgver}_amd64.deb")
sha256sums=('15864d26bf1a9de56e014cbaa2afbded554c2029b50c02705f77d4d28333ff70')

package() {
  cd "$srcdir"
  ar x "worklog_${pkgver}_amd64.deb"
  tar -xf data.tar.* -C "$pkgdir"
}
