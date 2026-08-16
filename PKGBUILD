# Maintainer: tee < teeaur at duck dot com >
pkgname=tasks-bin
pkgver=15.9.1
_pkgverz=${pkgver/.0}
pkgrel=1
pkgdesc="Tasks.org: Open Source To-Do Lists & Reminders that's Private, Powerful, flexible, Customizable and multilingual, with Multiple sync options"
arch=(x86_64)
url="https://tasks.org"
license=('GPL-3.0-or-later')
depends=(glibc libgcc libstdc++ hicolor-icon-theme zlib)
provides=('tasks')
conflicts=('tasks')
source_x86_64=("https://github.com/tasks/tasks/releases/download/$pkgver/tasks-org-$_pkgverz-linux-amd64.tar.gz")
sha256sums_x86_64=('5336e7e2a487511f1bf1deff56c23f3e6164602481cbede8800f20c2ef14cef6')
#noextract=("tasks-org-$pkgver-linux-amd64.tar.gz")

package() {
    sed -i "s|/usr/lib/tasksorg-llc/tasks-org||" "tasks-org-$_pkgverz/share/applications/org.tasks.desktop"
    mv "tasks-org-$_pkgverz" "$pkgdir/usr"
}
