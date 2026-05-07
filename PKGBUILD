# makepkg --printsrcinfo > .SRCINFO
pkgname=worklog-bin
pkgver=1.2.9
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
sha256sums=('80e3e9649a8297149268b64568aa643ce0d736c8be065ce346d4020629adac88')

package() {
  cd "$srcdir"
  ar x "worklog_${pkgver}_amd64.deb"
  tar -xf data.tar.* -C "$pkgdir"
}
