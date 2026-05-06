# makepkg --printsrcinfo > .SRCINFO
pkgname=worklog-bin
pkgver=1.2.6
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
sha256sums=('2eda6a1c9f56d87e8c00183eea5eaee6ecd820e91c51ed1d1b67fc4d1d23c2cd')

package() {
  cd "$srcdir"
  ar x "worklog_${pkgver}_amd64.deb"
  tar -xf data.tar.* -C "$pkgdir"
}
