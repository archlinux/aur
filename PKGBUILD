# Maintainer: tee < teeaur at duck dot com >
pkgname=tasks-bin
pkgver=15.7.4
pkgrel=1
pkgdesc="Tasks.org To-Do Lists & Reminders that's Powerful and flexible, Customizable and mutilingual, with Multiple sync options"
arch=(x86_64)
url="https://tasks.org"
license=('GPL-3.0-or-later')
depends=(glibc libstdc++ hicolor-icon-theme zlib)
provides=('tasks')
conflicts=('tasks')
source_x86_64=("https://github.com/tasks/tasks/releases/download/${pkgver}/tasks-org-$pkgver-linux-amd64.tar.gz")
sha256sums_x86_64=('3ba1b1cc092d82a6b572012f89ec793583a5c3b974a04a2bdb7ee60382497020')
#noextract=("tasks-org-$pkgver-linux-amd64.tar.gz")

package() {
    sed -i 's|/usr/lib/tasksorg-llc/tasks-org||' "tasks-org-$pkgver/share/applications/org.tasks.desktop"
    mv "tasks-org-$pkgver" "$pkgdir/usr"
}
