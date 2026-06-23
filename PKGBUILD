# Maintainer: tee < teeaur at duck dot com >
pkgname=tasks-bin
pkgver=15.7.2
pkgrel=1
pkgdesc="Tasks.org To-Do Lists & Reminders that's Powerful and flexible, Customizable and mutilingual, with Multiple sync options"
arch=(x86_64)
url="https://tasks.org"
license=('GPL-3.0-or-later')
depends=(glibc libstdc++ hicolor-icon-theme zlib)
provides=('tasks')
conflicts=('tasks')
source_x86_64=("https://github.com/tasks/tasks/releases/download/${pkgver}/tasks-org-$pkgver-linux-amd64.tar.gz")
sha256sums_x86_64=('595ece56ded7313b47f7e43859ebce5a4a3dc78cbe7246040efb0b32c3cf5e9a')
#noextract=("tasks-org-$pkgver-linux-amd64.tar.gz")

package() {
    sed -i 's|/usr/lib/tasksorg-llc/tasks-org||' "tasks-org-$pkgver/share/applications/org.tasks.desktop"
    mv "tasks-org-$pkgver" "$pkgdir/usr"
}
