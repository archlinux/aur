# Maintainer: tee < teeaur at duck dot com >
pkgname=tasks-bin
pkgver=15.11
_pkgverz=${pkgver/.0}
pkgrel=1
pkgdesc="Tasks.org: Open Source, Open Protocol, To-Do Lists & Reminders that's Private, Powerful, flexible, Customizable and multilingual, with Multiple sync options"
arch=(x86_64)
url="https://tasks.org"
license=('GPL-3.0-or-later')
depends=(glibc libgcc libstdc++ hicolor-icon-theme zlib)
provides=('tasks')
conflicts=('tasks')
#source=("https://update.tasks.org/keys.asc")
#sha256sums=('SKIP')
source_x86_64=("https://github.com/tasks/tasks/releases/download/$pkgver/tasks-org-$_pkgverz-linux-amd64.tar.gz")
sha256sums_x86_64=('7aa509bc4bd1f8f16c036faceedc52339d3bc282c4e523626c3d2d4a9c1b20ab')
validpgpkeys=("224FA88A5A19A03B06827A1BF60CE2127D6BBBDE")

package() {
  sed -i "s|/usr/lib/tasksorg-llc/tasks-org||" "tasks-org-$_pkgverz/share/applications/org.tasks.desktop"
  mv "tasks-org-$_pkgverz" "$pkgdir/usr"
}
