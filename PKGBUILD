# Maintainer: tee < teeaur at duck dot com >
pkgname=tasks-bin
pkgver=15.3.0
pkgrel=1
pkgdesc="Tasks.org To-Do Lists & Reminders that's Customizable and mutilingual, with Multiple sync options"
arch=(x86_64)
url="https://tasks.org"
license=('GPL-3.0-or-later')
depends=(glibc libgcc libstdc++ fontconfig zlib)
provides=('tasks')
conflicts=('tasks')
source_x86_64=("https://github.com/tasks/tasks/releases/download/${pkgver%.*}/tasks-org-$pkgver-linux-amd64.tar.gz")
sha256sums_x86_64=('b7f9535d1307f2ad4b28c409a33c96ec05c45c40cba15cf87e88ecc60c37f1a2')

package() {
    sed -i 's|/usr/lib/tasksorg-llc/tasks-org||' "tasks-org-$pkgver/share/applications/org.tasks.desktop"
    mv "tasks-org-$pkgver" "$pkgdir/usr"
}
