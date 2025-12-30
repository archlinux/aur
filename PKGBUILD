# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@antergos.com>

_pkgbase=nemo-extensions
pkgname=nemo-seahorse
pkgver=6.6.0
pkgrel=3
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
b2sums=(e3803f0d9254a663576c532e0dbdc08e29eac625ee18274725acdf37f73a1757f557b1bb6452a1f2578ac4c48017e919123ae9c36c117e5e917a81538b4f2d84)

build() {
  cd $_pkgbase/$pkgname
  arch-meson . build \
    --libexecdir=lib/$_dir
}

package(){
  cd $_pkgbase/$pkgname
  meson install -C build --destdir="$pkgdir"
}
