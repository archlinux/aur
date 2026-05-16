# Maintainer: tee < teeaur at duck dot com >
pkgname=tasks-bin
pkgver=15.5.0
pkgrel=1
pkgdesc="Tasks.org To-Do Lists & Reminders that's Customizable and mutilingual, with Multiple sync options"
arch=(x86_64)
url="https://tasks.org"
license=('GPL-3.0-or-later')
depends=(glibc libstdc++ hicolor-icon-theme zlib)
provides=('tasks')
conflicts=('tasks')
source_x86_64=("https://github.com/tasks/tasks/releases/download/${pkgver%.*}/tasks-org-$pkgver-linux-amd64.tar.gz")
sha256sums_x86_64=('c297873e54c3764afd229503330acbc9ad9493084b672fd9e6ae3a96bcbb1576')

package() {
    sed -i 's|/usr/lib/tasksorg-llc/tasks-org||' "tasks-org-$pkgver/share/applications/org.tasks.desktop"
    cp -ar "tasks-org-$pkgver" "$pkgdir/usr"
}
