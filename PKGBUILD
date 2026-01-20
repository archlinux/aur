pkgname=xfce4-panel-xfce-ask-git
_pkgbase=xfce-ask
pkgver=c3f77bf
pkgrel=1
pkgdesc="XFCE panel plugin: quick one-off questions to OpenAI-compatible chat endpoints"
arch=('x86_64' 'aarch64')
url="https://github.com/rabfulton/xfce-ask"
license=('MIT')
depends=('xfce4-panel' 'gtk3' 'libsoup3' 'json-glib' 'libsecret')
makedepends=('git' 'pkgconf')
provides=('xfce4-panel-xfce-ask')
conflicts=('xfce4-panel-xfce-ask')
source=("git+https://github.com/rabfulton/xfce-ask.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"
  git describe --long --tags --always | sed 's/^v//; s/-/.r/; s/-/./'
}

build() {
  cd "$srcdir/$_pkgbase"
  make
}

package() {
  cd "$srcdir/$_pkgbase"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
