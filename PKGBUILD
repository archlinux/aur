# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=cockpit-session-recording
pkgver=21
pkgrel=1
pkgdesc='Cockpit UI for session recording'
arch=('any')
url='https://github.com/Scribery/cockpit-session-recording'
license=(LGPL-2.1-or-later)
depends=(cockpit tlog)
source=("https://github.com/Scribery/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha512sums=('06e138e220cc7bf4c814a3367dacc6836e3a4fffc35229593a021b462a555210e6b1e0ed56e31398214b43e4f5cc27b8ebf778df3f02e6a13ea8a7a2f24eb379')
b2sums=('05793191554877b49f710e4e0a7932c483d15e7e836a3957ab77a1f0e0ff5f863da68978ae02c39eca58e2d5db16d014eab2338cfd31b242219266f31b7c1c6e')

package() {
  cd "$pkgname" || exit
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
