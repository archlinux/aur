# Maintainer: tee < teeaur at duck dot com >
pkgname=tasks-bin
pkgver=15.4.2
pkgrel=1
pkgdesc="Tasks.org To-Do Lists & Reminders that's Customizable and mutilingual, with Multiple sync options"
arch=(x86_64)
url="https://tasks.org"
license=('GPL-3.0-or-later')
depends=(glibc libstdc++ hicolor-icon-theme zlib)
provides=('tasks')
conflicts=('tasks')
source_x86_64=("https://github.com/tasks/tasks/releases/download/${pkgver}/tasks-org-$pkgver-linux-amd64.tar.gz")
sha256sums_x86_64=('5271ac02a90b83a3c694a629312687a719e184b8a05670e7a5ccd509d1515088')

package() {
    sed -i 's|/usr/lib/tasksorg-llc/tasks-org||' "tasks-org-$pkgver/share/applications/org.tasks.desktop"
    cp -ar "tasks-org-$pkgver" "$pkgdir/usr"
}
