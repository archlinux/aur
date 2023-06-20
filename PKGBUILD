# Maintainer: Ashish Kushwaha  <ashish.kus2408@gmail.com>
pkgname=taskdiary
pkgver=1.0.r7.d4b1868.r7.d4b1868
pkgrel=1
pkgdesc="Simple task manager always ready on cli"
arch=('x86_64')
url="https://github.com/ashish-kus/TaskDiary"
license=('MIT')
makedepends=('git')
provides=('todo')
conflicts=('todo')
source=("git+https://github.com/ashish-kus/TaskDiary.git")
md5sums=('SKIP')


pkgver() {
  cd "TaskDiary"
  printf "$pkgver.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
        cd TaskDiary
        install -Dm755 ./todo "$pkgdir/usr/bin/todo"
        install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
        install -Dm644 ./LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
