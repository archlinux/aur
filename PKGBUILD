# Maintainer: tee < teeaur at duck dot com >
pkgname=tasks-bin
pkgver=15.14.1
_pkgverz=${pkgver/.0}
pkgrel=1
pkgdesc="Tasks.org: Open Source, Open Protocol, To-Do Lists & Reminders that's Private, Powerful, flexible, Customizable and multilingual, with Multiple sync options"
arch=(x86_64)
url="https://tasks.org"
license=('GPL-3.0-or-later')
depends=(glib2 glibc libgcc libstdc++ hicolor-icon-theme zlib)
provides=('tasks')
conflicts=('tasks')
#source=("https://update.tasks.org/keys.asc")
#b2sums=('SKIP')
b2sums_x86_64=('6300bf0e1f08afb9948caef743e609d9eed4ddf5ca554bec31a22e41bbff64a7f3b3b5d83a97510f59e4a0f6f7a2d8538014f2fdece8c2bee6a4a4184761863e')
source_x86_64=("https://github.com/tasks/tasks/releases/download/$_pkgverz/tasks-org-$pkgver-linux-amd64.tar.gz")
validpgpkeys=("224FA88A5A19A03B06827A1BF60CE2127D6BBBDE")

package() {
  sed -i "s|/usr/lib/tasksorg-llc/tasks-org||" "tasks-org-$pkgver/share/applications/org.tasks.desktop"
  mv "tasks-org-$pkgver" "$pkgdir/usr"
}
