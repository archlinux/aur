# Maintainer: tee < teeaur at duck dot com >
pkgname=tasks-bin
pkgver=15.14.0
_pkgverz=${pkgver/.0}
pkgrel=1
pkgdesc="Tasks.org: Open Source, Open Protocol, To-Do Lists & Reminders that's Private, Powerful, flexible, Customizable and multilingual, with Multiple sync options"
arch=(x86_64)
url="https://tasks.org"
license=('GPL-3.0-or-later')
depends=(glib2 glibc libgcc libstdc++ hicolor-icon-theme zlib)
provides=('tasks')
conflicts=('tasks')
source=("https://update.tasks.org/keys.asc")
b2sums=('SKIP')
b2sums_x86_64=('158530d176345e2c7fe19950f5a227c911588fc8aa808667d7935b70eabf465bfe2d79d4a390b2cc9819a9d222441c2901e6ad6ebee48c12622c4d14fd6452c0')
source_x86_64=("https://github.com/tasks/tasks/releases/download/$_pkgverz/tasks-org-$pkgver-linux-amd64.tar.gz")
validpgpkeys=("224FA88A5A19A03B06827A1BF60CE2127D6BBBDE")

package() {
  sed -i "s|/usr/lib/tasksorg-llc/tasks-org||" "tasks-org-$pkgver/share/applications/org.tasks.desktop"
  mv "tasks-org-$pkgver" "$pkgdir/usr"
}
