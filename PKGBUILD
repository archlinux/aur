# Maintainer: "Sergey Malkin <adresatt@gmail.com>"
pkgname=syncall
pkgver=1.5.1
pkgrel=2
pkgdesc="Bi-directional synchronization between services such as Taskwarrior, Google Calendar, Notion, Asana, and more"
url="https://github.com/bergercookie/syncall"
arch=("i686" "x86_64")
license=("MIT")
depends=("python" "python-bubop" "python-bidict" "python-loguru" "python-item_synchronizer")
makedepends=("python-build" "python-installer")
optdepends=("python-google-api-python-client"
            "python-google-auth-oauthlib"
            "python-gkeepapi"
            "python-notion-client"
            "python-asana"
            "python-caldav"
            "python-icalendar"
            "python-taskw"
            "python-xattr")
source=("https://github.com/bergercookie/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("b3d68526b0b78675fda7b7f3c3280d41e90bfb1b86e90db2abe9e08129464fda")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel 
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
