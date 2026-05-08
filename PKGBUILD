# Maintainer: tee < teeaur at duck dot com >
pkgname=tasks-bin
pkgver=15.4.0
pkgrel=1
pkgdesc="Tasks.org To-Do Lists & Reminders that's Customizable and mutilingual, with Multiple sync options"
arch=(x86_64)
url="https://tasks.org"
license=('GPL-3.0-or-later')
depends=(glibc libgcc libstdc++ hicolor-icon-theme zlib)
provides=('tasks')
conflicts=('tasks')
source_x86_64=("https://github.com/tasks/tasks/releases/download/${pkgver%.*}/tasks-org-$pkgver-linux-amd64.tar.gz")
sha256sums_x86_64=('53e6b6acf76d97627a3e00877b88e58ea2048ac45656af31d7da076489e1d8b1')

package() {
    sed -i 's|/usr/lib/tasksorg-llc/tasks-org||' "tasks-org-$pkgver/share/applications/org.tasks.desktop"
    cp -ar "tasks-org-$pkgver" "$pkgdir/usr"
}
