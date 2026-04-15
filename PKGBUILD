# Maintainer: tee < teeaur at duck dot com >
pkgname=tasks-bin
pkgver=15.2.1
pkgrel=1
pkgdesc="Tasks.org To-Do Lists & Reminders that's Customizable and mutilingual, with Multiple sync options"
arch=(x86_64)
url="https://tasks.org"
license=('GPL-3.0-or-later')
provides=('tasks')
conflicts=('tasks')
source_x86_64=("https://github.com/tasks/tasks/releases/download/$pkgver/tasks-org-$pkgver-linux-amd64.tar.gz")
sha256sums_x86_64=('18bc114a0866aa3007e46f3b507c5fd71632ebff5f4af154a8c41bf8bdd28cef')

package() {
    cd "tasks-org-$pkgver"
    sed -i 's|/usr/lib/tasksorg-llc/tasks-org||' share/applications/org.tasks.desktop
    mkdir "$pkgdir/usr"
    mv * "$pkgdir/usr"
}
