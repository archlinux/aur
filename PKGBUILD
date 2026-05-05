# makepkg --printsrcinfo > .SRCINFO
pkgname=worklog-bin
pkgver=1.2.5
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
sha256sums=('885c98a869bd373108f5c72b26aef1089dcee5298a73503132af3088c8282e39')

package() {
  cd "$srcdir"
  ar x "worklog_${pkgver}_amd64.deb"
  tar -xf data.tar.* -C "$pkgdir"
}
