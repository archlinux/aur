# Maintainer: tee < teeaur at duck dot com >
pkgname=tasks-bin
pkgver=15.10
_pkgverz=${pkgver/.0}
pkgrel=1
pkgdesc="Tasks.org: Open Source To-Do Lists & Reminders that's Private, Powerful, flexible, Customizable and multilingual, with Multiple sync options"
arch=(x86_64)
url="https://tasks.org"
license=('GPL-3.0-or-later')
depends=(glibc libgcc libstdc++ hicolor-icon-theme zlib)
provides=('tasks')
conflicts=('tasks')
#source=("https://update.tasks.org/keys.asc")
#sha256sums=('SKIP')
source_x86_64=("https://github.com/tasks/tasks/releases/download/$pkgver/tasks-org-$_pkgverz-linux-amd64.tar.gz")
sha256sums_x86_64=('10a8cc05b3e475de006134c3bf826012fb21e02c3a49600d338c695809fef512')
validpgpkeys=("224FA88A5A19A03B06827A1BF60CE2127D6BBBDE")

package() {
  sed -i "s|/usr/lib/tasksorg-llc/tasks-org||" "tasks-org-$_pkgverz/share/applications/org.tasks.desktop"
  mv "tasks-org-$_pkgverz" "$pkgdir/usr"
}
