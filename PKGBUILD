pkgname=localist-bin
_version=1.21.6
pkgver=${_version//-/}
pkgrel=1
pkgdesc='A local project organizer for folders, repositories, and work in progress'
arch=('x86_64')
url='https://github.com/skorotkiewicz/localist'
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
provides=("localist=${pkgver}")
conflicts=('localist')
options=('!strip' '!debug')
source=(
  "https://github.com/skorotkiewicz/localist/releases/download/v${_version}/localist_${_version}_amd64.deb"
  "https://github.com/skorotkiewicz/localist/releases/download/v${_version}/LICENSE"
)
sha256sums=('bcfa8247c1079ca397c722d9792781fa50cba35ce622326915d4b9c042185457' '184086b302ece79e686ac701ca404fe7a49499626c82f684dce1b820af59710c')

package() {
  bsdtar -xf "$srcdir"/data.tar.* -C "$pkgdir"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
