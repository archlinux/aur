# Maintainer: Frederik "Freso" S. Olesen <freso.dk@gmail.com>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: vinicentus
# Based on package by Jelle van der Waa <jelle vdwaa nl>.
pkgname=networkmanager-dispatcher-chrony
pkgver=2.3
pkgrel=2
pkgdesc="Dispatcher Script for chrony"
arch=(any)
license=('MIT')
url='https://wiki.gnome.org/Projects/NetworkManager'
depends=(
  'networkmanager'
  'chrony'
  'which'
  'sh'
)
backup=(etc/NetworkManager/dispatcher.d/10-chrony)
changelog=ChangeLog
source=('10-chrony' 'LICENSE')
sha256sums=('8ff88e8e3c854803ae98cd7c12e418ec708d1093ca05d642d6bee2f4c9e14a4a'
            '6358e86c9886f041d48e5f8e84e2fc56018ece396bad52e8ee44d901be29d695')

package() {
  install -Dm755 "$srcdir/10-chrony" "$pkgdir/etc/NetworkManager/dispatcher.d/10-chrony"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
