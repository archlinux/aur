# Maintainer: "Gustav Åkerström <gustavakerstrom@gmail.com>"
# Contributor: "Sergey Malkin <adresatt@gmail.com>"

pkgname=syncall
pkgver=1.8.8
pkgrel=1
pkgdesc="Bi-directional synchronization between services such as Taskwarrior, Google Calendar, Notion, Asana, and more"
url="https://github.com/bergercookie/syncall/"
arch=("i686" "x86_64")
license=("MIT")
depends=(
  "python>=3.8" "python-yaml>=5.3.1" "python-bidict>=0.21.4" "python-click>=8.1.7"
  "python-loguru>=0.5.3" "python-dateutil>=2.9.0" "python-item_synchronizer>=1.1.5" 
  "python-bubop>=0.1.12" "python-setuptools>=72.1.0"
)
makedepends=(
  "python-build" "python-installer"
  )
optdepends=(
  "python-asana>=1.0.0" 
  "python-caldav>=0.11.0" 
  "python-icalendar>=5.0.13"
  "task>=2.6"
  "python-taskw-ng=0.2.7"
  "python-xattr>=0.99.9"
  "python-pyxdg>=0.28"
  "python-google-api-python-client"
  "python-google-auth-oauthlib"
  "python-gkeepapi"
  "python-notion-client"
)

provides=("syncall")
conflicts=("syncall")

source=("https://github.com/bergercookie/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('dde09bd575b7fa5827b5bc2bff380db674490a000f41e51e860b6ec8f14ce6d6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel 
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
