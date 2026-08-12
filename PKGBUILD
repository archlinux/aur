# Maintainer: tee < teeaur at duck dot com >
pkgname=tasks-bin
pkgver=15.9
pkgrel=1
pkgdesc="Tasks.org To-Do Lists & Reminders that's Powerful and flexible, Customizable and mutilingual, with Multiple sync options"
arch=(x86_64)
url="https://tasks.org"
license=('GPL-3.0-or-later')
depends=(glibc libstdc++ hicolor-icon-theme zlib)
provides=('tasks')
conflicts=('tasks')
source_x86_64=("https://github.com/tasks/tasks/releases/download/${pkgver}/tasks-org-$pkgver.0-linux-amd64.tar.gz")
sha256sums_x86_64=('c742a8901418f99c61f8c6b56b41f0a21acabfad9aaf4f6f8f69060ec75bbd8e')
#noextract=("tasks-org-$pkgver-linux-amd64.tar.gz")

package() {
    sed -i 's|/usr/lib/tasksorg-llc/tasks-org||' "tasks-org-$pkgver.0/share/applications/org.tasks.desktop"
    mv "tasks-org-$pkgver.0" "$pkgdir/usr"
}
