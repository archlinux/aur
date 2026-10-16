# Maintainer: tee < teeaur at duck dot com >
pkgname=tasks-bin
pkgver=15.13.0
_pkgverz=${pkgver/.0}
pkgrel=1
pkgdesc="Tasks.org: Open Source, Open Protocol, To-Do Lists & Reminders that's Private, Powerful, flexible, Customizable and multilingual, with Multiple sync options"
arch=(x86_64)
url="https://tasks.org"
license=('GPL-3.0-or-later')
depends=(glib2 glibc libgcc libstdc++ hicolor-icon-theme zlib)
provides=('tasks')
conflicts=('tasks')
#source=("https://update.tasks.org/keys.asc")
#sha256sums=('SKIP')
sha256sums_x86_64=('dfb4bcf8e8371419d092348bbe33e3785b6345c497d53943da16eba00fe16cc8')
source_x86_64=("https://github.com/tasks/tasks/releases/download/$_pkgverz/tasks-org-$pkgver-linux-amd64.tar.gz")
validpgpkeys=("224FA88A5A19A03B06827A1BF60CE2127D6BBBDE")

package() {
  sed -i "s|/usr/lib/tasksorg-llc/tasks-org||" "tasks-org-$pkgver/share/applications/org.tasks.desktop"
  mv "tasks-org-$pkgver" "$pkgdir/usr"
}
