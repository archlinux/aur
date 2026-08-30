# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@antergos.com>

_pkgbase=nemo-extensions
pkgname=nemo-seahorse
pkgver=6.6.0
pkgrel=4
pkgdesc='PGP encryption and signing extension for Nemo'
arch=(x86_64)
url='https://github.com/linuxmint/nemo-extensions'
license=(GPL-2.0-or-later)
depends=(
  dbus-glib
  dconf
  gcr
  glib2
  glibc
  gpgme
  gtk3
  libcryptui
  libnotify
  nemo
)
makedepends=(
  git
  glib2-devel
  meson
)
optdepends=('cinnamon-translations: i18n')
source=("git+https://github.com/linuxmint/nemo-extensions.git#tag=$pkgver")
b2sums=('SKIP')

build() {
  cd $_pkgbase/$pkgname
  arch-meson . build \
    --libexecdir=lib/$_dir
}

package(){
  cd $_pkgbase/$pkgname
  meson install -C build --destdir="$pkgdir"
}
