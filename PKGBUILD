# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Nikola Hadžić <nikola@firemail.cc>

pkgname=nixwriter
pkgver=2.0.0
pkgrel=1
pkgdesc="Create bootable Linux images with dd and from a GTK user interface"
arch=(x86_64)
url="https://gitlab.com/9898287/nixwriter"
license=(MIT)
depends=(gtk3)
makedepends=(git cargo)
optdepends=("libnotify: notifications")
source=("git+https://gitlab.com/9898287/nixwriter.git#tag=${pkgver}")
sha256sums=("SKIP")

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -D target/release/nixwriter "${pkgdir}"/usr/bin/nixwriter
  install -Dm644 com.gitlab.adnan338.Nixwriter.desktop "${pkgdir}"/usr/share/applications/com.gitlab.adnan338.Nixwriter.desktop
  install -Dm644 com.gitlab.adnan338.Nixwriter.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/com.github.adnan338.Nixwriter.svg
  install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

