# Maintainer: tee < teeaur at duck dot com >
pkgname=tasks-bin
pkgver=15.8
pkgrel=1
pkgdesc="Tasks.org To-Do Lists & Reminders that's Powerful and flexible, Customizable and mutilingual, with Multiple sync options"
arch=(x86_64)
url="https://tasks.org"
license=('GPL-3.0-or-later')
depends=(glibc libstdc++ hicolor-icon-theme zlib)
provides=('tasks')
conflicts=('tasks')
source_x86_64=("https://github.com/tasks/tasks/releases/download/${pkgver}/tasks-org-$pkgver.0-linux-amd64.tar.gz")
sha256sums_x86_64=('e148c86f67e4a4aecdb88e3775daeacf653a7f96135c6120e9be33680adc340c')
#noextract=("tasks-org-$pkgver-linux-amd64.tar.gz")

package() {
    sed -i 's|/usr/lib/tasksorg-llc/tasks-org||' "tasks-org-$pkgver.0/share/applications/org.tasks.desktop"
    mv "tasks-org-$pkgver.0" "$pkgdir/usr"
}
