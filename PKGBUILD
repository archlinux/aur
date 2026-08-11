# Maintainer: knightinfected <hmzmahmood5@gmail.com>

# Transitional package. `pipewire-control-center` was published to the AUR
# first (2026-08-11); this depends on it, so it is unbuildable before that.
#
# Kept deliberately as a transitional package rather than orphaning or deleting
# `pipewire-controller`: the 2026-07-30 AUR upload freeze existed because
# attackers adopt orphaned packages to inject malware, and this name has real
# users. Holding it costs nothing and keeps it out of circulation.
#
# This commit is based directly on b5fa691 (0.3.6-1, the last published state),
# NOT on the local 0.4.0 bump bb2a96b. That commit was never pushed and never
# will be: it renames nothing and its pkgdesc is 275 characters, which the AUR
# hook rejects outright ("pkgdesc field too long" — the 255-char cap, which
# also bit the first push of pipewire-control-center). It is preserved out of
# the branch under a tag:
#   git checkout superseded-0.4.0-oldname -- PKGBUILD
#
# pkgver tracks the pipewire-control-center release that carries the rename
# (v0.5.0).

pkgname=pipewire-controller
pkgver=0.5.0
pkgrel=1
pkgdesc="Transitional package — PipeWire Controller has been renamed to pipewire-control-center"
arch=('any')
url="https://github.com/knightinfected/PipeWireController"
license=('GPL-3.0-or-later')
depends=('pipewire-control-center')
source=()
sha256sums=()

package() {
  # Metapackage: the dependency does all the work. Installing this pulls in
  # pipewire-control-center and removes the old /usr/bin/pipewire-controller,
  # /usr/share/pipewire-controller/ and pipewire-controller.desktop that
  # earlier versions of this package owned.
  :
}
